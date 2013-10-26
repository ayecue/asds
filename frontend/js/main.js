$(function(){

	// Public Informations
	var userName = "swagger"

	// Station Section 
	function loadStationInformations(id){
		$(".greyLayer").fadeIn("fast", function(){
				$.mobile.loading( 'show' );
				$.ajax({
					url: "station.json",
					context: document.body
				}).done(function(data) {
					$(".ownerName").text(data.owner);
					$("#stationDetail").attr("data-active-station",data.id);
					$(".stationName").text(data.name);

					if(data.owner == userName){
						$('[data-role="button"][data-icon="plus"]').hide();
						$(".ownerName").text("you are the Owner");
					} else {
						$('[data-role="button"][data-icon="minus"]').hide();
					}

					$.mobile.changePage('#stationDetail', 'pop', true, true);
					$(".greyLayer").fadeOut( 'fast',function(){
						$.mobile.loading( 'hide' );
					});
				});

		});
	}

	function loadOwnStations(){
		if($("#stations").attr("data-loaded") == "false"){
			$(".greyLayer").fadeIn("fast", function(){
					$.mobile.loading( 'show' );
					$.ajax({
						url: "ownStation.json",
						context: document.body
					}).done(function(data) {

						$.each(data, function(index, value) {
							addOwnStation(value[0].id, value[0].name);
						}); 
						$("#stationContent").listview('refresh');

						$(".greyLayer").fadeOut( 'fast',function(){
							$("#stations").attr("data-loaded","true")
							$.mobile.loading( 'hide' );
						});
					});

			});
		}
	}

	function addOwnStation(id, name){
		var liObjekt = '<li><a href="#" class="ui-link-inherit" data-station-id="'+id+'">'+name+'</a></li>';
		$("#stationContent").prepend(liObjekt);
		$('[data-station-id="'+id+'"]').click(function(){loadStationInformations(id)});
	}

	// Money History
	function addHistoryMoney(value, Comment, transferDate){
		var classMoney = "";
		if(value < 0){
			classMoney = "minusMonney";
		} else {
			classMoney = "plusMonney";
		}
		var liObjekt = '<li><span class="'+classMoney+'">'+value+' </span> '+Comment+' | '+transferDate+'</li>';

		$("#moneyHistoryContent").append(liObjekt);
	}

	// Event Hitory
	function addHistoryEvent(Comment, transferDate){
		var liObjekt = '<li>'+Comment+' | '+transferDate+'</li>';

		$("#eventHistoryContent").prepend(liObjekt);
	}

	function loadEvents(){
		if($("#eventHistory").attr("data-loaded") == "false"){
			$(".greyLayer").fadeIn("fast", function(){
					$.mobile.loading( 'show' );
					$.ajax({
						url: "events.json",
						context: document.body
					}).done(function(data) {

						$.each(data, function(index, value) {
							addHistoryEvent(value[0].comment,value[0].transferDate);
						}); 
						$("#eventHistoryContent").listview('refresh');

						$(".greyLayer").fadeOut( 'fast',function(){
							$("#eventHistory").attr("data-loaded","true")
							$.mobile.loading( 'hide' );
						});
					});

			});
		}
	}

 	$('#stations').bind('pageshow', loadOwnStations );
 	$('#eventHistory').bind('pageshow', loadEvents );
});