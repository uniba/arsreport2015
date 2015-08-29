//= require jquery
//= require _libs/instagram

function page_index() {

  function init() {
    instagram_slider();
  }

  // instagram
  function instagram_slider() {
    var $instargram = $('.main-wrapper');
    var instagramObj = null;
    $instargram.on('didLoadInstagram', function(event, response) {
      instagramObj = response;
      console.log(instagramObj);
      loopPanels();
    });

    $instargram.instagram({
      hash: 'arselectronica',
      clientId: '71cc8e4705ff4acb8b4b6190f12be242',
      count: 40
    });

    function loopPanels() {
      var timer;
      var $targets = $('.panel');
      function loopMethod() {
        var url = getUrl();
        var target = $targets.get( Math.floor( Math.random( ) *  $targets.length ) );

        setBG( $(target), url )
        timer = setTimeout( loopMethod , Math.random() * 600 + 600 );
      }

      function setBG( $target, url ) {
        $target.animate( { opacity: 0 }, 100, imgPreload );

        function imgPreload() {
          var img = new Image();
          img.src = url;
          img.onload = function() {
            $target.css( { 
              'background-image': 'url(' + url + ')'
            } );
            $target.animate( { opacity: 1 }, 100, imgPreload );
          }
        }
      }

      function getUrl() {
        var randIndex = Math.floor( Math.random( ) *  instagramObj.data.length );
        var imgData = instagramObj.data[ randIndex ];
        var url = imgData.images.standard_resolution.url;
        return url;
      }

      for (var i = $targets.length - 1; i >= 0; i--) {
        var url = getUrl();
        var target = $targets.get(i);
        setBG( $(target), url )
      };

      timer = setTimeout( loopMethod , 1200 );
    
    }
  }



  init();
}