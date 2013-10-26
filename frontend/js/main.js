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

	function addOwnStation(id, name){
		var liObjekt = '<li><a href="#" data-station-id="'+id+'">'+name+'</a></li>';
		$("#stationContent").append(liObjekt);
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

		$("#eventHistoryContent").append(liObjekt);
	}


	addOwnStation("17", "Station of Death");
	addOwnStation("18", "Station of Death");
	addOwnStation("19", "Station of Death");
	addOwnStation("20", "Station of Death");
	addOwnStation("16", "Station of Death");
	addOwnStation("15", "Station of Death");
});