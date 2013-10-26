$(function(){
	console.log("start System");

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

	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
	addHistoryMoney(-45,"Swag", "gestern");
});