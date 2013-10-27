$(document).ready(function(){
	var gClasses = google.maps;

	var MapController = function(){
		var self = this,
			container = $('#googlemapscontainer'),
			ui_wrapper = container.parents('.ui-panel-content-wrap:eq(0)');

		$.extend(self,{
			container : container,
			ui_wrapper : ui_wrapper,
			ui_header : ui_wrapper.children('.ui-header'),
			ui_content : ui_wrapper.children('.ui-content'),
			map : new gClasses.Map(container.get(0),{
				center : new gClasses.LatLng(52.519171,13.406091),
				zoom : self._self.maxZoom,
				mapType : gClasses.MapTypeId.TERRAIN,
				streetViewControl : false,
				mapTypeControl : false
			}),
			bounds : new gClasses.LatLngBounds(
				new gClasses.LatLng(52.33963,13.091166), 
				new gClasses.LatLng(52.675454,13.761118)
			),
			locationCache : {},
			transitLayer : new gClasses.TransitLayer()
		});

		self.initEvents();
		self.initMap();
	};

	$.extend(MapController,{
		minZoom : 16,
		maxZoom : 14
	});

	$.extend(MapController.prototype,{
		_self : MapController,
		initEvents : function(){
			var self = this;

			//Rezise event
			$(window).resize(function(){
				self.resize();
			});

			$('#map').bind( "pageshow", function( event ) {
				self.resize();
				self.validateZoom();
			});

			gClasses.event.addListener(self.map, 'zoom_changed', function(){
				self.validateZoom();
			});

			//Drag back
			gClasses.event.addListener(self.map, 'dragend',function(){
				var map = self.map,
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

				map.setCenter(new gClasses.LatLng(y, x));
			});
		},
		initMap : function(){
			var self = this,
				bounds = self.bounds;

			self.map.fitBounds(bounds);
			self.transitLayer.setMap(self.map);
			self.validateZoom();
			self.resize();
			self.getStations();
		},
		resize : function(){
			var self = this,
				h1 = $(window).height(),
				w1 = $(window).width(),
				h2 = self.ui_header.outerHeight();

			self.container.css({
				height:h1-h2,
				width:w1
			});

			gClasses.event.trigger(self.map, 'resize');
		},
		validateZoom : function(){
			var self = this,
				zoom = self.map.getZoom();

			if (zoom < self._self.maxZoom) {
				self.map.setZoom(self._self.maxZoom);
			} else if (zoom > self._self.minZoom) {
				self.map.setZoom(self._self.minZoom);
			}
		},
		getStations : function(){
			var self = this,
				center = self.map.getCenter();

			$.ajax({
				url : 'https://admin.staging.dev.outfittery.de/locations.json',
				dataType : 'json',
				data : {
					lat : center.lat(),
					lng : center.lng()
				},
				success : function(data){
					$.each(data,function(_,item){
						var id = item.id,
							coords = item.latlong.coordinates,
							name = item.name,
							url = item.url;

						self.addStation(id,name,coords[0],coords[1],url);
					});

					self.drawStations();
				}
			});
		},
		addStation : function(id,name,lat,lng,url){
			var self = this,
				hash = lat + 'x' + lng;

			if (hash in self.locationCache) {
				gClasses.event.removeListener(self.locationCache[hash].clickListener);
				self.locationCache[hash].marker.setMap(null);
			}

			self.locationCache[hash] = {
				id : id,
				name : name,
				lat : lat,
				lng : lng,
				url : url,
				marker : new gClasses.Marker()
			};
		},
		drawStations : function(){
			var self = this;

			$.each(self.locationCache,function(_,item){
				item.marker.setOptions({
					position : new gClasses.LatLng(item.lat,item.lng),
					title : item.name,
					visible : true,
					map : self.map
				});

				item.clickListener = gClasses.event.addListener(item.marker,'click',function(){
					self.container.trigger('markerInteraction',item);
					console.log('markerInteraction',item);
				});
			});
		}
	});

	new MapController();
});