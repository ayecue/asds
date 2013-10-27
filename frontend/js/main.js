$(function(){

	// Public Informations
	var userName = "swagger"

	// Station Section 
	function loadStationInformations(id){
		//$(".greyLayer").fadeIn("fast", function(){
		$(".greyLayer").show();		
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

		//});
	}

	function loadOwnStations(){
		if($("#stations").attr("data-loaded") == "false"){
		//$(".greyLayer").fadeIn("fast", function(){
		$(".greyLayer").show();		
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
							$("#stations").attr("data-loaded","true");
							$.mobile.loading( 'hide' );
						});
					});

		//	});
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
		var liObjekt = '<li><div class="ui-grid-b"><div class="'+classMoney+' ui-block-a custom-money-col-a">'+value+' $</div><div class="ui-block-b custom-money-col-b">'+Comment+'</div><div class="ui-block-c custom-money-col-c">'+transferDate+'</div></div></li>';

		$("#moneyHistoryContent").prepend(liObjekt);
	}

	function loadMoneyHistory(){
		if($("#moneyHistory").attr("data-loaded") == "false"){
			//$(".greyLayer").fadeIn("fast", function(){
			
			$(".greyLayer").show();		
					$.mobile.loading( 'show' );
					$.ajax({
						url: "moneyHistory.json",
						context: document.body
					}).done(function(data) {

						$.each(data, function(index, value) {
							addHistoryMoney(value[0].value,value[0].comment,value[0].transferDate);
						}); 
						$("#moneyHistoryContent").listview('refresh');

						$(".greyLayer").fadeOut( 'fast',function(){
							$("#moneyHistory").attr("data-loaded","true")
							$.mobile.loading( 'hide' );
						});
					});

		//	});
		}
	}

	// Event Hitory
	function addHistoryEvent(Comment, transferDate){
		var liObjekt = '<li><div class="ui-grid-b"><div class="ui-block-a custom-event-col-a">'+Comment+'</div><div class="ui-block-b custom-event-col-b">'+transferDate+'</div></div></li>';

		$("#eventHistoryContent").prepend(liObjekt);
	}

	function loadEventsHistory(){
		if($("#eventHistory").attr("data-loaded") == "false"){
			//$(".greyLayer").fadeIn("fast", function(){

			$(".greyLayer").show();		
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

			//});
		}
	}

	function triggerPopUp(title, content, buttonText, image){
		$("#popupTitle").text(title);
		$("#popupContent").text(content);
		if($(".ui-btn-text","#popupButton").length > 0){
			$(".ui-btn-text","#popupButton").text(buttonText);
		}else {
			$("#popupButton").text(buttonText);
		}
		$("#popupImage").attr("src", image);
		$.mobile.changePage('#newEvent', 'pop', true, true);
	}

 	$('#stations').bind('pageshow', loadOwnStations );
 	$('#eventHistory').bind('pageshow', loadEventsHistory );
 	$('#moneyHistory').bind('pageshow', loadMoneyHistory );


 	function showStation(data){
 		$("#stationDetail").attr("data-active-station",data.id);
 		$(".stationName","#stationDetail").text(data.name);
		$("#popupStationTitle").text(data.name);
		$("#popupStationPrice").text(1337);
 		$('[data-role="button"][data-icon="plus"]').click(showStationBill);
 		if(parseInt(1337 > parseInt($(".UserMoney").text())){
 			$(".functionBuyStation").addClass("ui-disabled");
 		}
		$.mobile.changePage('#stationDetail', 'pop', true, true);
 	}
	function showStationBill(){
		$.mobile.changePage('#buyStation', 'pop', true, true);
	}

	function buyStation(){
		if(parseInt($("#popupStationPrice").text()) > parseInt($(".UserMoney").text())){
			// ajax
		}else{

		}

	}
	$(".functionBuyStation").click(buyStation);

 	$("#googlemapscontainer").on( "markerInteraction", function( event, data ) {
		showStation(data);
	});
});