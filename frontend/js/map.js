$(document).ready(function(){
	var MapController = function(){
		var container = $('#googlemapscontainer'),
			ui_wrapper = container.parents('.ui-panel-content-wrap:eq(0)');

		$.extend(this,{
			container : container,
			ui_wrapper : ui_wrapper,
			ui_header : ui_wrapper.children('.ui-header'),
			ui_content : ui_wrapper.children('.ui-content'),
			gmap : new GMaps({
				div: '#googlemapscontainer',
				lat: 52.519171,
				lng: 13.406091
			}),
			bounds : new google.maps.LatLngBounds(
				new google.maps.LatLng(52.33963,13.091166), 
				new google.maps.LatLng(52.675454,13.761118)
			)
		});

		this.initEvents();
		this.initMap();
		this.resize();
	};

	$.extend(MapController.prototype,{
		initEvents : function(){
			var self = this;

			//Rezise event
			$(window).resize(function(){
				self.resize();
			});

			//Drag back
			google.maps.event.addListener(self.gmap.map, 'dragend',function(){
				var map = self.gmap.map,
					bounds = self.bounds;

				if (bounds.contains(map.getCenter())) return;

				// We're out of bounds - Move the map back within the bounds

				var c = map.getCenter(),
					x = c.lng(),
					y = c.lat(),
					maxX = bounds.getNorthEast().lng(),
					maxY = bounds.getNorthEast().lat(),
					minX = bounds.getSouthWest().lng(),
					minY = bounds.getSouthWest().lat();

				if (x < minX) x = minX;
				if (x > maxX) x = maxX;
				if (y < minY) y = minY;
				if (y > maxY) y = maxY;

				map.setCenter(new google.maps.LatLng(y, x));
			});
		},
		initMap : function(){
			var self = this,
				bounds = self.bounds;

			self.gmap.fitBounds(bounds);

			var maxX = bounds.getNorthEast().lng(),
				maxY = bounds.getNorthEast().lat(),
				minX = bounds.getSouthWest().lng(),
				minY = bounds.getSouthWest().lat(),
				path = [
					//[maxX,maxY],
					//[minX,maxY],
					[minX,minY],
					[maxX,minY]
				];

			console.log(path);

			self.gmap.drawPolyline({
				path: path, // pre-defined polygon shape
				strokeColor: '#BBD8E9',
				strokeOpacity: 1,
				strokeWeight: 3
			});
		},
		resize : function(){
			var self = this,
				h1 = $(window).height(),
				w1 = $(window).width(),
				h2 = self.ui_header.outerHeight();

			self.container.css({
				height:h1-h2-10,
				width:w1-30
			});

			self.gmap.refresh();
		}
	});

	new MapController();
});