$(document).ready(function() {
 	$('.delete_link').on('click', function(event){
 		event.preventDefault();
 		var clicked_link = $(this)
 		var url = $(this).attr('href');
 		console.log(url);

 		$.get(url, function(response){
 			console.log(response);
 			clicked_link.after(response);
 		}); //close get
 	}); //close click event

}); //close document
