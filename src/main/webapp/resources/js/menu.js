let animationIn = 'animated fadeInUp';
let animationOut = 'animated fadeOutUp';
let transitionend = 'transitionend webkitTransitionEnd oTransitionEnd';

$(".menu-button").on('click', function() {
  if($('.menu').hasClass("menu--open")) {
    $('.menu__link').removeClass('menu__link--anim').addClass('menu__link--reverse');
    setTimeout(() => {
      $('.menu').removeClass("menu--open");
      $('.menu__list').addClass('menu__list--hidden');
      $('.menu__link').removeClass('menu__link--reverse');
      $('.menu-button').removeClass("menu-button--active");
    }, 900);
  } else {
    $('.menu__list').removeClass('menu__list--hidden');
    $('.menu-button').addClass("menu-button--active");
    $('.menu').addClass("menu--open").one(transitionend, () => {
      $('.menu__link').addClass('menu__link--anim');
    });
  };
});
        // $('.menu__link')
        //   .addClass(animationIn)
        //   .one(transitionend, function() {
        //     $('.menu__link')
        //       .removeClass(animationIn); 
        //   });