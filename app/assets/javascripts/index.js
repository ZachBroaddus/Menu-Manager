$(document).ready(function() {
  // Select all links with hashes
  $('a[href*="#"]')
    // Remove links that don't actually link to anything
    .not('[href="#"]')
    .not('[href="#0"]')
    .click(function(event) {
      // On-page links
      if (
        location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
        &&
        location.hostname == this.hostname
      ) {
        // Figure out element to scroll to
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
        // Does a scroll target exist?
        if (target.length) {
          // Only prevent default if animation is actually gonna happen
          event.preventDefault();
          $('html, body').animate({
            scrollTop: target.offset().top - 60
          }, 1000, function() {
            // Callback after animation
            // Must change focus!
            var $target = $(target);
            $target.focus();
            if ($target.is(":focus")) { // Checking if the target was focused
              return false;
            } else {
              $target.attr('tabindex','-1'); // Adding tabindex for elements not focusable
              $target.focus(); // Set focus again
            };
          });
        }
      }
    });

  // scroll to appetizer list on click of order button if logged in
  var scrollToAppetizers = function() {
    $('html, body').animate({ scrollTop: $("#appetizers").offset().top - 60 }, 1000);
    return false;
  };

  $('.col-lg-9').on('click', '.js--start-order', function(event){
    if (Number.isInteger($('#html').data('session'))) {
      scrollToAppetizers();
    }
  });

  $('.card-footer').on('click', '.js--add-to-order', function(event){
    // console.log('add button clicked!');
    $target = $(this);
  });

  $('.card-footer').on('click', '.js--remove-from-order', function(event){
    // console.log('remove button clicked!');
    $target = $(this);
  });


  // timeout for flash error messages
  $(function() {
    setTimeout(function(){
      $('.alert').slideUp(500);
    }, 4000);
  });

  // fix html padding after flash notice disappears
  var flashNotice = document.getElementById('flash-alert');

  var observer = new MutationObserver(function(mutations) {
     if (document.contains(flashNotice)) {
          console.log("There's a flash notice in the DOM!");
          document.getElementById("html").style.paddingTop = "14px";
          observer.disconnect();
      }
  });

  observer.observe(document, {attributes: false, childList: true, characterData: false, subtree:true});
});
