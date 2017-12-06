// <h1>Here are your posts, via AJAX! (Or rather, AJAJ)</h1>

// <a id="get-post-button" href="javascript:loadPosts();">Load new posts</a>

// <div id="posts">
// 	<p>Posts</p>	
// </div>

// <div id="new-post-form">
// 	<input type="text" id="post-content" />
// 	<button id="add-post">Add new post!</button>
// </div>

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