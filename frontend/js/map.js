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
				mapTypeId : self._self.layoutId,
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

		self.initLayout();
		self.initEvents();
		self.initMap();
	};

	$.extend(MapController,{
		minZoom : 16,
		maxZoom : 14,
		symbolScale : 20,
		layoutId : 'TRAINLAYOUT'
	});

	$.extend(MapController.prototype,{
		_self : MapController,
		initLayout : function(){
			var self = this,
				layout = new gClasses.StyledMapType([
				    {
				      stylers: [
				        { visibility: 'simplified' }
				      ]
				    },
				    {
				      featureType: 'water',
				      elementType: 'all',
				      stylers: [
				        { hue: '#CCCCCC' },
				        { weight: 0.2 }
				      ]
				    },
				    {
				      elementType: 'labels',
				      stylers: [
				        	{ visibility: 'off' }
				      ]
				    },
				    {
						featureType: 'transit.line',
						elementType: 'geometry',
						stylers: [
							{ visibility: 'on' },
							{ weight: 2.0}
						]
					},
					{
						featureType: 'transit.station',
						elementType: 'all',
						stylers: [
							{ visibility: 'on' },
							{ weight : 2.0}
						]
					}
			  	], {
					name : self._self.layoutId
				});

			self.map.mapTypes.set(self._self.layoutId, layout);
		},
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
						var settings = {
							id : item.id,
							lat : item.latlong.coordinates[0],
							lng : item.latlong.coordinates[1],
							name : item.name,
							location_ownership : item.location_ownership,
							price : item.price
						};

						self.addStation(settings);
					});

					self.drawStations();
				}
			});
		},
		addStation : function(settings){
			var self = this,
				hash = settings.lat + 'x' + settings.lng;

			if (hash in self.locationCache) {
				gClasses.event.removeListener(self.locationCache[hash].clickListener);
				self.locationCache[hash].marker.setMap(null);
			}

			self.locationCache[hash] = {
				data : settings,
				marker : new gClasses.Marker()
			};
		},
		drawStations : function(){
			var self = this;

			$.each(self.locationCache,function(_,item){
				var data = item.data,
					ownership = data.location_ownership,
					user = ownership ? ownership.user : null;

				item.marker.setOptions({
					position : new gClasses.LatLng(data.lat,data.lng),
					title : data.name,
					visible : true,
					map : self.map,
					icon : {
						scale : self._self.symbolScale,
						path : gClasses.SymbolPath.CIRCLE,
						fillColor : user ? user.color : '#CCC',
						fillOpacity : 0.5,
						strokeWeight : 1
					}
				});

				item.clickListener = gClasses.event.addListener(item.marker,'click',function(){
					self.container.trigger('markerInteraction',[item.data]);
				});
			});
		}
	});

	new MapController();
});