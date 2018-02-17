$(document).ready(function() {

  // initialize add to homescreen message for mobile users
  // addToHomescreen();
  var addtohome = addToHomescreen({
     autostart: false
  });
  addtohome.show();

  // initialize dropdown styling
  $('select').niceSelect();

  // initialize file input styling
  $('.fileinput').fileinput();

  // toggle tooltip
  $('[data-toggle="tooltip"]').tooltip();

  var animationEnd = (function(el) {
    var animations = {
      animation: 'animationend',
      OAnimation: 'oAnimationEnd',
      MozAnimation: 'mozAnimationEnd',
      WebkitAnimation: 'webkitAnimationEnd',
    };

    for (var t in animations) {
      if (el.style[t] !== undefined) {
        return animations[t];
      }
    }
  })(document.createElement('div'));


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

  $('.col-lg-9').on('click', '.js--start-order', function(){
    if (Number.isInteger($('html').data('session'))) {
      scrollToAppetizers();
    }
  });

  $('.card-footer').on('click', '.js--add-to-order', function(){
    // console.log('add button clicked!');
    $target = $(this);
  });

  $('.card-footer').on('click', '.js--remove-from-order', function(){
    // console.log('remove button clicked!');
    $target = $(this);
  });

  // timeout for flash error messages
  var shortDelay = 500;
  var longDelay = 4000;
  $(function() {
    setTimeout(function(){
      $('.alert').slideUp(shortDelay);
    }, longDelay);
  });

  // fix html padding after flash notice disappears
  var flashNotice = document.getElementById('flash-alert');

  var observer = new MutationObserver(function(mutations) {
     if (document.contains(flashNotice)) {
        console.log("There's a flash notice in the DOM!");
        $("html").addClass("fix-flash-padding");

        setTimeout(function(){
            $("html").css("padding-top", "14px");
        }, shortDelay);

        setTimeout(function(){
            $(".item-form-h3").css("padding-top", "14px");
        }, longDelay);
        observer.disconnect();
      }
  });

  observer.observe(document, {attributes: false, childList: true, characterData: false, subtree:true});

  // do something after animation is done
  // $('.card').one(animationEnd, function(){
  //   // $('#js--greeting').addClass("animated bounceInLeft");
  //   $('.card').removeClass("animated fadeIn");
  // });

  // focus cursor on first form field and move it to end of existing text,
  // if existing text
  var focusElement = $('input:text:visible:first')
  focusElement.focus();
  var tmpStr = focusElement.val();
  focusElement.val('');
  focusElement.val(tmpStr);


  // show modal once per 30 minute window, trigger on scroll
  $(window).on('scroll', function(){
    var s = $(window).scrollTop(),
        d = $(document).height(),
        c = $(window).height();

    var scrollPercent = (s / (d - c)) * 100;

    // console.clear();
    // console.log(scrollPercent);
    if (scrollPercent > 80 && Cookies.get('modal_shown') == null) {
        var in30Minutes = 1/48;
        Cookies.set('modal_shown', 'yes', { expires: in30Minutes, path: '/' });
        $('#myModal').modal('show');
    }
  })


});







