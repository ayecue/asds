$(function(){

	// Public Informations
	var userName = "";
	var userMoney = 0;
	var userID = 0;

	var HostURL = "https://admin.staging.dev.outfittery.de";
	var activeStation = 0;

	// Station Section 
	function loadStationInformations(id){
		//$(".greyLayer").fadeIn("fast", function(){
		$(".greyLayer").show();		
		console.log(HostURL+"/ĺocations/"+id+".json");
				$.mobile.loading( 'show' );
				$.ajax({
					url: HostURL+"/locations/"+id+".json"
				}).done(function(data) {
					$(".ownerName").text(data.location_ownership.user.name);
					$("#stationDetail").attr("data-active-station",data.id);
					$(".stationName").text(data.name);

					if(data.location_ownership.user_id == userID){
						$('[data-role="button"][data-icon="plus"]').hide();
						$('[data-role="button"][data-icon="minus"]').show();
						$(".ownerName").text("you are the Owner");
					} else {
						$('[data-role="button"][data-icon="minus"]').hide();
						$('[data-role="button"][data-icon="plus"]').show();
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
						url: HostURL+"/users/"+userID+"/locations.json",
						context: document.body
					}).done(function(data) {
						$.each(data, function(index, value) {
							addOwnStation(value.id, value.name);
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
						url: HostURL+"/transaktions.json",
						context: document.body
					}).done(function(data) {
						$.each(data, function(index, value) {
							var preText = "";
							if(value.action == "ACTION_LOCATION_TAKE_OWNERSHIP"){
								preText = "buyed ";
							}
							addHistoryMoney(value.amount,preText+value.transaktionable.name,value.transaktionable.updated_at);
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

		if(data.location_ownership != null){
			if(data.location_ownership.user.id == userID){
				$('[data-role="button"][data-icon="plus"]').hide();
				$('[data-role="button"][data-icon="minus"]').show();
				$(".ownerName").text("you are the Owner");
			} else {
				$('[data-role="button"][data-icon="minus"]').hide();
				$('[data-role="button"][data-icon="plus"]').hide();
				$(".ownerName").html(data.location_ownership.user.name);
			}
		}else{
			$(".ownerName").html("City");
			$('[data-role="button"][data-icon="minus"]').hide();
			$('[data-role="button"][data-icon="plus"]').show();
		}

		$("#popupStationPrice").text(data.price);
		$('[data-role="button"][data-icon="plus"]').unbind( "click" );
 		$('[data-role="button"][data-icon="plus"]').click(showStationBill);
 		$("#buyButton").addClass("ui-disabled");

 		if(data.price < userMoney){
 			$("#buyButton").removeClass("ui-disabled");
 			activeStation = data.id;
 			$("#buyButton").click(buyStation);
 		}

		$.mobile.changePage('#stationDetail', 'pop', true, true);
 	}

	function showStationBill(){
		$.mobile.changePage('#buyStation', 'pop', true, true);
	}

 	$("#googlemapscontainer").on( "markerInteraction", function(event,data ) {
		showStation(data);
	});

 	$("#googlemapscontainer").on( "mapLoaded", function(event,data ) {
		$(".greyLayer").fadeOut( 'fast',function(){
			$.mobile.loading( 'hide' );
			setTimeout(function(){passStation(35)}, 7000);
		});
	});

 	$("#googlemapscontainer").on( "beforeMapLoaded", function(event,data ) {
		$(".greyLayer").show();		
		$.mobile.loading( 'show' );
	});


	function updateUserMoney(playerMoney){
		$(".UserMoney").each(function(){$(this).text(playerMoney);});
	}

	function passStation(stationID){
		$.ajax({
			url: HostURL+"/locations/"+stationID+"/passing",
			context: document.body
		}).done(function(data) {
			if(data.status == "charged"){
				updateUserInformation();
				triggerPopUp("passed a Station", "You passed a Station and have to pay "+(data.object.amount*-1)+"$","OK!","images/ticket.gif");
			}
		});
	}

	function updateUserInformation(){
		$.ajax({
			url: HostURL+"/users/me"

			}).done(function(data) {
				userName = data.name;
				userID = data.id;
				userMoney = data.wallet.total;
				updateUserMoney(userMoney);
				$(".playerName").html(userName);
		});

	}

	function buyStation(){
		$.ajax({
			url: HostURL+"/locations/"+activeStation+"/buy"
		}).done(function(data) {
			updateUserInformation();
		});
	}
	updateUserInformation();
});