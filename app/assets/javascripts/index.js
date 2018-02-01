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

  // var orderId = $("#js--menu").data("order-id");
  // if (orderId === "") {
  //   $('.card-footer').hide();
  // };

  $('.card-footer').on('click', '.js--add-to-order', function(event){
    // console.log('add button clicked!');
    $target = $(this);
  });

  $('.card-footer').on('click', '.js--remove-from-order', function(event){
    // console.log('remove button clicked!');
    $target = $(this);
  });

  var scrollToTop = function() {
    // $("html, body").animate({ scrollTop: 0 }, "slow");
    $('html, body').animate({ scrollTop: 0 }, 1000);
    return false;
  };

  $('.col-lg-9').on('click', '.js--start-order', function(event){
    // console.log('start order button click detected!');
    scrollToTop();
  });

  // $('.col-lg-9').on('click', '.js--cancel-order', function(event){
  //   // event.preventDefault();
  //   console.log('cancel order button click detected!');
  //   // $('.js--cancel-order').hide();
  //   // not on the page, can't show. need to render partial from controller
  //   // $('.js--start-order').show();
  // });

});
