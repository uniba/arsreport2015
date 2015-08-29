//= require jquery
//= require _pages/index
//= require _pages/days

$(function(){

  var $html = $('html');

  if( $html.hasClass('index') ) {
    page_index();
  } else if ( $html.hasClass('days') ) {
    page_days();
  }
  
});