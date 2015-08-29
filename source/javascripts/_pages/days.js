//= require jquery
//= require _libs/textshuffle

function page_days() {
  
  var $articles = $('.ariticles li');
  var BASE = 300;
  var BASE2 = BASE - 100;
  function init() {

    startAnimation();
  }

  function startAnimation() {
    var time = BASE * ($articles.length + 1);

    $('.timeline').animate( {
      height: '100%'
    }, time );

    for (var i = 0; i < $articles.length; i++) {
      (function(local){ 
        setTimeout(function(){ 
          var target = $articles.get(local);
          var $target = $(target);
          
          $target.addClass('visible')
          $target.find('h2').shuffleLetters();
          $target.find('.text').shuffleLetters({"step" : 4, "fps": 60});
          $target.find('.link a').shuffleLetters();
        }, BASE * local);
      }(i)); 
    };
  }

  init();
}