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
			userMarker : new gClasses.Marker(),
			locationCache : {},
			transitLayer : new gClasses.TransitLayer(),
			page : $('#map')
		});

		self.initLayout();
		self.initEvents();
		self.initMap();
	};

	$.extend(MapController,{
		minZoom : 16,
		maxZoom : 14,
		symbolScale : 20,
		userScale : 5,
		layoutId : 'TRAINLAYOUT',
		animationRate : 4000,
		refreshRate : 600000,
		countdownRate : 1000
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

			setInterval(function(){
				self.activePage && self.getStations();
			},self._self.refreshRate);

			//Rezise event
			$(window).resize(function(){
				self.resize();
			});

			self.page.bind( "pageshow", function( event ){
				self.activePage = true;
				self.getStations();
				self.resize();
				self.validateZoom();
			});

			self.page.bind( "pagehide", function( event ){
				self.activePage = false;
				self.removeAllStations();
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

			if ($.mobile.activePage && $.mobile.activePage.attr("id") == "map") {
				self.getStations();
				self.resize();
				self.validateZoom();
			}

			self.userMarker.setOptions({
				visible : false,
				map : self.map,
				icon : {
					scale : self._self.userScale,
					path : gClasses.SymbolPath.CIRCLE,
					fillColor : '#ffa900',
					fillOpacity : 1,
					strokeWeight : 1
				}
			});
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
		setUserMarker : function(lat,lng) {
			var self = this,
				hash = lat + 'x' + lng;

			if (hash in self.locationCache) {
				self.container.trigger('stationpassed',[self.locationCache[hash].data]);
			}

			self.userMarker.setOptions({
				visible : true,
				position : new gClasses.LatLng(lat,lng)
			});
		},
		getStations : function(){
			var self = this,
				center = self.map.getCenter();

			self.container.trigger('beforeMapLoaded');

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
					self.container.trigger('mapLoaded',[data]);
				}
			});
		},
		removeAllStations : function(){
			var self = this;

			$.each(self.locationCache,function(_,item){
				item.infoWindow && item.infoWindow.close();
				item.animationDelay && clearTimeout(item.animationDelay);
				item.animationInterval && clearInterval(item.animationInterval);
				item.infoCountdownInterval && clearInterval(item.infoCountdownInterval);
				item.marker.setAnimation(null);
				item.marker.setMap(null);
			});
		},
		addStation : function(settings){
			var self = this,
				hash = settings.lat + 'x' + settings.lng;

			if (hash in self.locationCache) {
				var oldLocation = self.locationCache[hash];

				gClasses.event.removeListener(oldLocation.clickListener);

				oldLocation.infoWindow && oldLocation.infoWindow.close();
				oldLocation.animationDelay && clearTimeout(oldLocation.animationDelay);
				oldLocation.animationInterval && clearInterval(oldLocation.animationInterval);
				oldLocation.infoCountdownInterval && clearInterval(oldLocation.infoCountdownInterval);
				oldLocation.marker.setAnimation(null);
				oldLocation.marker.setMap(null);
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
					user = ownership ? ownership.user : null,
					settings = {};

				settings.position = new gClasses.LatLng(data.lat,data.lng);
				settings.title = data.name;
				settings.visible = true;
				settings.map = self.map;
				settings.icon = {};
				settings.icon.scale = self._self.symbolScale;
				settings.icon.path = gClasses.SymbolPath.CIRCLE;
				settings.icon.fillColor = user ? user.color : '#CCC';
				settings.icon.fillOpacity = 0.5;
				settings.icon.strokeWeight = 1;

				item.marker.setOptions(settings);

				if (!user) {
					item.animationDelay = setTimeout(function(){
						item.animationDelay = null;
						item.animationInterval = setInterval(function(){
							if (item.marker.getAnimation() == null) {
								item.marker.setAnimation(gClasses.Animation.BOUNCE);
							} else {
								item.marker.setAnimation(null);
							}
						},self._self.animationRate);
					},Math.random() * 1000);
				} else {
					var node = $('<div />').addClass('mapUserInfo'),
						infoWrapper = $('<div />'),
						image = $('<img />'),
						text = $('<span />'),
						time = $('<span />'),
						timeStart = new Date(ownership.start).getTime() / 1000,
						timeEnd = new Date(ownership.end).getTime() / 1000,
						timeFn = function(){
							var timestamp = timeEnd - (new Date().getTime() / 1000),
								days    = Math.floor(timestamp/ (24 * 60 * 60)),
						        hours   = Math.floor(timestamp/ (60 * 60)) % 24,
						        minutes = Math.floor(timestamp/ 60) % 60,
						        seconds = Math.floor(timestamp/ 1) % 60,
						        string = '';


							days > 0 && (string += days + ' days,');
							hours > 0 && (string += hours + ':');
							minutes > 0 && (string += minutes + ':');
							string += seconds;

							if (seconds < 0) {
								string = 'Ready';
							}
						    time.html(' (' + string + ')');
						};

					node.css('text-align','center');
					image.attr('src',user.img_url);
					image.css('width',16);
					image.css('height',16);
					text.html(user.name);
					timeFn();

					node
						.append(infoWrapper);

					infoWrapper
						.append(image)
						.append(text)
						.append(time);

					item.infoWindow = new gClasses.InfoWindow({
						position : new gClasses.LatLng(data.lat,data.lng),
						content : node.get(0),
						disableAutoPan : true,
						maxWidth: 200
					});

					item.infoCountdownInterval = setInterval(function(){
						timeFn();
					},self._self.countdownRate);

					item.infoWindow.open(self.map,item.marker);

					gClasses.event.addListener(item.infoWindow,'domready',function(){
						var parent = node.parent();

						parent.next().hide();
						parent.css('top', parent.css('top') + 8);
						parent.width(parent.width() + 20);
						image.css('margin-right',5);
					});
				}

				item.clickListener = gClasses.event.addListener(item.marker,'click',function(){
					self.container.trigger('markerInteraction',[item.data]);
				});
			});
		}
	});

	var controller = new MapController();

	//Demo
	controller.container.on('demostart',function(){
		var todo = [
			[52.492868,13.460249],
			[52.49616,13.464339],
			[52.498406,13.467686],
			[52.502851,13.469093],
			[52.507602,13.473136],
			[52.511546,13.475754],
			[52.513613,13.4753],
			[52.520164,13.472021],
			[52.523245,13.468072],
			[52.524195,13.464884],
			[52.525151,13.459618],
			[52.528772,13.455944],
			[52.533167,13.450992],
			[52.53656,13.447645],
			[52.540426,13.439246]

		];

		//$.each(controller.locationCache,function(_,item){
		//	todo.push(item);
		//});

		if (!todo.length) {
			console.log('test case failed');
			return;
		}

		var length = todo.length,
			index = 0,
			callback = function(){
				setTimeout(function(){
					var item = todo[index];

					controller.setUserMarker(item[0],item[1]);
					controller.map.panTo(new gClasses.LatLng(item[0],item[1]));

					index++ < length && callback();
				},Math.random() * 1000 + 2000);
			};

		callback();
		console.log('demo start');
	});

	setTimeout(function(){
		controller.container.trigger('demostart');
	},10000);
});