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

$(".dropdown-toggle, .menu").click(function (e) {
 	var $div = $(this).parent("div").toggleClass('open');
 	return false;
 });

$("i.heart").click(function(e){
	var article_id = $(this).attr('id').substr(6);
	$.getJSON('articles/' + article_id + '/toggle_heart', function(data) {});
	$(this).toggleClass('icon-heart-empty').toggleClass('icon-heart');
})

$("h3.article-title").click(function(e){
	if(	$(this).parents('div.article').hasClass('unread')){
		var article_id = $(this).attr('id').substr(6);
		$.getJSON('articles/' + article_id + '/mark_read', function(data) {});
		$(this).parents('div.article').removeClass('unread').addClass('read');
	}
})