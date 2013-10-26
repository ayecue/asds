var http = require('http'),
	fs = require('fs'),
	sanitize = require('validator').sanitize;
	
var app = http.createServer(function (request, response) {
	if(request.url == "/admin"){
		fs.readFile("admin.html", 'utf-8', function (error, data) {
			response.writeHead(200, {'Content-Type': 'text/html'});
			response.write(data);
			response.end();
		});
	}else{	
		fs.readFile("client.html", 'utf-8', function (error, data) {
			response.writeHead(200, {'Content-Type': 'text/html'});
			response.write(data);
			response.end();
		});
	}
}).listen(1337);

var io = require('socket.io').listen(app);

io.sockets.on('connection', function(socket) { 
	socket.on('triggerEvent', function() { 
		var dataTrigger = new Array();
		dataTrigger["eventType"] = "Hunt";
		dataTrigger["station"] = "25";
		dataTrigger["message"] = "get IT";
		dataTrigger["startTime"] = 1231354531357513271;
		dataTrigger["endTime"] = 1231354531357523271;
		sendEvent(dataTrigger);
	});
	socket.on('triggerCard', function() { 
		var dataCard = new Array();
		dataCard["message"] = "u got the Jack";
		dataCard["cardType"] = "winner";
		dataCard["time"] = 1231354531357513271;
		sendCard(dataCard);
	});
	socket.on('sendDailyMoney', function() { 
		var dailymoney = new Array();
		dailymoney["value"] = 512;
		dailymoney["time"] = 1231354531357513271;
		sendDailyMoney(dailymoney);
	});

	function sendEvent(dataTrigger) { 
		io.sockets.emit("triggerEvent",{ message: dataTrigger["message"], station: dataTrigger["station"], eventType: dataTrigger["eventType"] }); 
	}
	function sendCard(dataCard) { 
		io.sockets.emit("reachedCard",{ message: dataCard["message"], cardType: dataCard["cardType"] }); 
	}
	function sendDailyMoney(dailymoney) { 
		io.sockets.emit("dailyMoney",{ money: dailymoney["value"] }); 
	}
});
