// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

function update_last_access(){
	var saved_search_long_id=$("#channel-container").find(">:first-child").attr('id');
	if (saved_search_long_id !== undefined){
		var saved_search_id= saved_search_long_id.substr(13)
		if(saved_search_id > 0){
			$.getJSON('/saved_searches/' + saved_search_id + '/update_last_access', function(data) {});
		}
	}
}

$("#channel-container").ready(function (e) {
	setTimeout(function(){update_last_access()}, 4000);
});

$("#logged-in-button, .menu").click(function (e) {
 	var $div = $(this).parent("div").toggleClass('open');
 	return false;
 });
$("i.heart").click(function(e){
	var article_id = $(this).attr('id').substr(6);
	$.getJSON('/articles/' + article_id + '/toggle_heart', function(data) {});
	update_last_access();
	$(this).toggleClass('icon-heart-empty').toggleClass('icon-heart');
	$("#b_"+$(this).attr('id')).toggleClass('icon-heart-empty').toggleClass('icon-heart');
	
	$(this).parents('div.article').addClass('read').removeClass('unread').removeClass('new');
})

$("a.mail").click(function(e){
	var article_id = $(this).attr('id').substr(5);
	$.getJSON('/articles/' + article_id + '/mark_read', function(data) {});
	update_last_access();
	$(this).parents('div.article').addClass('read').removeClass('unread').removeClass('new');
})
//bottom heart adn mail icons
$("i.b_heart").click(function(e){
	var heart_id = $(this).attr('id').substr(2);
	$("#"+heart_id).click();

})
$("a.b_mail").click(function(e){
	var mail_id = $(this).attr('id').substr(2);
	$(this).attr("href",$("#"+mail_id).attr('href'))
	return true;
})

$("h3.article-title").click(function(e){
	var article = $(this).parents('div.article')
	if(	article.hasClass('unread') || article.hasClass('new')){
		var article_id = $(this).attr('id').substr(6);
		$.getJSON('/articles/' + article_id + '/mark_read', function(data) {});
		update_last_access();
		$(this).parents('div.article').addClass('read').removeClass('unread').removeClass('new');
	}
})

$("a.add-feed").click(function(e){
		if(!$(this).hasClass("disabled")){
			var article_id = $(this).attr('id').substr(4);
			$.getJSON('/feeds/' + article_id + '/add_feed_for_current_user', function(data) {});
			$(this).addClass("disabled").html("<i class='icon-ok'></i>");
			$("a#rem_" + article_id).removeClass("disabled").html("<i class='icon-minus'></i>&nbsp;Remove");
		}
		return false;

})

$("a.remove-feed").click(function(e){
	if(!$(this).hasClass("disabled")){
		var article_id = $(this).attr('id').substr(4);
		$.getJSON('/feeds/' + article_id + '/remove_feed_for_current_user', function(data) {});
		$(this).addClass("disabled").html("<i class='icon-ok'></i>");
		$("a#add_" + article_id).removeClass("disabled").html("<i class='icon-plus'></i>&nbsp;Add");
	}
	return false;
})

$(".delete-channel").click(function(e){
	var channel_id = $(this).attr('id').substr(8);
	$("#channel-query").html($("#channel-title_"+channel_id).html());
	$("#channel-id-to-delete").val(channel_id);
})

$(".edit-channel").click(function(e){
	var channel_id = $(this).attr('id').substr(10);
	var action = $("#edit_channel_form").attr("action");
	$("#edit_channel_form").attr("action", action.concat(channel_id));
	$("#edit_channel_container #name").val($("#channel-name"+channel_id).html());
	$("#edit_channel_container #query").val($("#channel-query"+channel_id).html());
	$("#edit_channel_container #id").val(channel_id);
})




$("#confirm-delete").click(function(e){
	var channel_id = $("#channel-id-to-delete").val();
	$.ajax({
	    url: '/saved_searches/'+ channel_id,
	    type: 'DELETE',
	});	
	$("#channel-container_" + channel_id).remove();
})
