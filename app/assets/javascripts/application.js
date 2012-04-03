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

$("#logged-in-button, .menu").click(function (e) {
 	var $div = $(this).parent("div").toggleClass('open');
 	return false;
 });

$("i.heart").click(function(e){
	var article_id = $(this).attr('id').substr(6);
	$.getJSON('/articles/' + article_id + '/toggle_heart', function(data) {});
	$(this).toggleClass('icon-heart-empty').toggleClass('icon-heart');
	$(this).parents('div.article').removeClass('unread').addClass('read');
})

$("a.mail").click(function(e){
	var article_id = $(this).attr('id').substr(5);
	$.getJSON('/articles/' + article_id + '/mark_read', function(data) {});
	$(this).parents('div.article').removeClass('unread').addClass('read');
})

$("h3.article-title").click(function(e){
	if(	$(this).parents('div.article').hasClass('unread')){
		var article_id = $(this).attr('id').substr(6);
		$.getJSON('/articles/' + article_id + '/mark_read', function(data) {});
		$(this).parents('div.article').removeClass('unread').addClass('read');
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
