var globalOne = "Sol Ring";
var globalTwo = "Black Lotus";

function compareCards(one, two) {
	var information = "";
	$.getJSON("/compare_json?card1=" + one + "&card2=" + two, function(data){
		$("#pageTopNames").html(data[0]['name'] + " || " + data[1]['name']);
		//---------------------------------------------
		$("#imageOne").html("<img src='http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=" + data[0]['multiverse_id'] + "&type=card' class='center-block'>");
		$("#headNameOne").html(data[0]['name']);
		$("#searchMeOne").html("<a href='/magic?name=" + data[0]['name'] + "'>Search '" + data[0]['name'] + "'</a>");
		$("#colorIdOne").html("Color Identity: " + data[0]['color_identity']);
		$("#cmcOne").html("CMC: " + data[0]['cmc'].toString());
		$("#cardTypeOne").html("Types: " + data[0]['card_type']);
		$("#rarityOne").html("Rarity: " + data[0]['rarity']);
		$("#legalOne").html(data[0]['legalities']);
		//---------------------------------------------
		$("#imageTwo").html("<img src='http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=" + data[1]['multiverse_id'] + "&type=card' class='center-block'>");
		$("#headNameTwo").html(data[1]['name']);
		$("#searchMeTwo").html("<a href='/magic?name=" + data[1]['name'] + "'>Search '" + data[1]['name'] + "'</a>");
		$("#colorIdTwo").html("Color Identity: " + data[1]['color_identity']);
		$("#cmcTwo").html("CMC: " + data[1]['cmc'].toString());
		$("#cardTypeTwo").html("Types: " + data[1]['card_type']);
		$("#rarityTwo").html("Rarity: " + data[1]['rarity']);
		$("#legalTwo").html(data[1]['legalities']);
		//---------------------------------------------
		$("#comparNames").html(data[0]['name'] + " || " + data[1]['name']);
		//---------------------------------------------
		if (data[0]['cmc'] < data[1]['cmc']){
			$("#cmc").html("|<b class='better'>" + data[0]['cmc'] + "</b>|<i class='worse'>" + data[1]['cmc'] + "</i>|");
		} else if (data[0]['cmc'] > data[1]['cmc']) {
			$("#cmc").html("|<i class='worse'>" + data[0]['cmc'] + "</i>|<b class='better'>" + data[1]['cmc'] + "</b>|");
		} else {
			$("#cmc").html("|<strong class='same'>" + data[0]['cmc'] + "</strong>|<strong class='same'>" + data[1]['cmc'] + "</strong>|");
		}
		// -----
		
		// -----
		if (data[0]['rarity'] === data[1]['rarity']){
			$("#rarity").html("|<strong class='same'>" + data[0]['rarity'] + "</strong>|<strong class='same'>" + data[1]['rarity'] + "</strong>|");
		} else {
			$("#rarity").html("|<i class='different'>" + data[0]['rarity'] + "</i>|<i class='different'>" + data[1]['rarity'] + "</i>|");
		}
		//---------------------------------------------
		globalOne = data[0]['name'];
		globalTwo = data[1]['name'];
	});
}

function newCardValues(friendCard, enemyCard) {
	if ($("#firstCard").val() === "") {
		var newCardOne = friendCard;
	} else {
		var newCardOne = $("#firstCard").val();
	}
	if ($("#secondCard").val() === "") {
		var newCardTwo = enemyCard;
	} else {
		var newCardTwo = $("#secondCard").val();
	}
	compareCards(newCardOne, newCardTwo);
	$("#firstCard").val('');
	$("#secondCard").val('');
}