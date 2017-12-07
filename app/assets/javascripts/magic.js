// function loadPosts() {
// 	var html = "";
// 	$.getJSON('/posts.json', function(data){
// 		console.log("Request is complete");
// 		console.log(data);
// 		// data = [{"id": 2, "content": "foo"}]
// 		//fizzbar is the index variable that jquery just KNOWS how to use. I hate javascript
// 		$.each(data, function(fizzbar){
// 			html += "<p>" + data[fizzbar].content + "</p>";
// 		});

// 		$("#posts").html(html);
// 	});
// }

// function createPost() {
// 	var postContentValue = $("#post-content").val();
// 	$.post('/posts.json', {post:{content: postContentValue}});
// 	$("#post-content").val('');
// }

// $(window).on('load', function(){
// 	loadPosts();
// });
// $("#add-post").click(function(){
// 	console.log("new post!");
// 	createPost();
// });

$(window).on('load', function(){
	compareCards();
});

function compareCards() {
	var information = "";
	$.getJSON("/compare_json?card1=" + cardOne + "&card2=" + cardTwo, function(data){
		console.log(data);
		// var nameTest = data[0]['name']
		// console.log(nameTest)
		
	});
}