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

$('.js--add-to-order').click(function(event){
  // event.preventDefault();
  console.log('button clicked!');

  $form = $(this);
  data = $form.serialize();
  method = $form.attr('method');
  url = $form.attr('action');

  $form.hide();
  // $form.closest('.card-footer').find('.js--remove-from-order').show();

  // $.ajax({
  //   method: method,
  //   data: data,
  //   dataType: "JSON",
  //   url: url
  // }).done(function(response){
  //   window.location = "/users/" + response.user_id;
    // $('.js--remove-from-order').show();
  // })

});



});
