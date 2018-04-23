jQuery(function($) { "use strict";
  
  
  /*============================*/
  /* WINDOW LOAD */
  /*============================*/

  $(window).load(function(){
    $('.preloader').fadeOut(700);
    izotopInit();
    stikyHeader();
  });

  /*============================*/
  /* VARIABLES */
  /*============================*/

  var swipers = [], winW, winH, winScr, _isresponsive, smPoint = 480, mdPoint = 768, lgPoint = 992, addPoint = 1200, _ismobile = navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i);

  function pageCalculations(){
    winW = $(window).width();
    winH = $(window).height();
  }
  pageCalculations();

  if(_ismobile) {$('body').addClass('mobile');}
  var ua = window.navigator.userAgent;
  var msie = ua.indexOf("MSIE ");

  if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))
  {
   $('.bg.ready').removeAttr('data-jarallax').addClass('fix'); 
 }

 var isSafari = /Safari/.test(navigator.userAgent) && /Apple Computer/.test(navigator.vendor);
 if (isSafari) {
   $('.bg.ready').removeAttr('data-jarallax');
 }

 if(_ismobile) {
   $('body').addClass('mobile');
   $('.bg').removeAttr('data-jarallax');
 }    

 function updateSlidesPerView(swiperContainer){
  if(winW>=addPoint) return parseInt(swiperContainer.attr('data-add-slides'),10);
  else if(winW>=lgPoint) return parseInt(swiperContainer.attr('data-lg-slides'),10);
  else if(winW>=mdPoint) return parseInt(swiperContainer.attr('data-md-slides'),10);
  else if(winW>=smPoint) return parseInt(swiperContainer.attr('data-sm-slides'),10);
  else return parseInt(swiperContainer.attr('data-xs-slides'),10);
}

function resizeCall(){
  
  pageCalculations();
  $('.swiper-container.initialized[data-slides-per-view="responsive"]').each(function(){
    var thisSwiper = swipers['swiper-'+$(this).attr('id')], $t = $(this), slidesPerViewVar = updateSlidesPerView($t), centerVar = thisSwiper.params.centeredSlides;
    thisSwiper.params.slidesPerView = slidesPerViewVar;
    thisSwiper.update();
    if(!centerVar){
      var paginationSpan = $t.find('.pagination span');
      var paginationSlice = paginationSpan.hide().slice(0,(paginationSpan.length+1-slidesPerViewVar));
      if(paginationSlice.length<=1 || slidesPerViewVar>=$t.find('.swiper-slide').length) $t.addClass('pagination-hidden');
      else $t.removeClass('pagination-hidden');
      paginationSlice.show();
    }
  });
}
if(!_ismobile){
  $(window).resize(function(){
    resizeCall();
  });
} else{
  window.addEventListener("orientationchange", function() {
    resizeCall();
    filterMobile();
  }, false);
}

/*============================*/
/* SWIPER SLIDER */
/*============================*/

function initSwiper(){
  var initIterator = 0;
  $('.swiper-container').each(function(){  
    var $t = $(this);  
    var index = 'swiper-unique-id-'+initIterator;

    $t.addClass('swiper-'+index + ' initialized').attr('id', index);
    $t.find('.pagination').addClass('pagination-'+index);

    var autoPlayVar = parseInt($t.attr('data-autoplay'),10);
    var slideEffect = $t.attr('data-effect');
    var slidesPerViewVar = $t.attr('data-slides-per-view');

    if(slidesPerViewVar == 'responsive'){
      slidesPerViewVar = updateSlidesPerView($t);
    }

    var autoHeight = parseInt($t.attr('data-autoheight'),10);
    var directMode = $t.attr('data-mode');
    var loopVar = parseInt($t.attr('data-loop'),10);
    var speedVar = parseInt($t.attr('data-speed'),10);
    var centerVar = parseInt($t.attr('data-center'),10);
    var freeMode = parseInt($t.attr('data-freemode'),10);


    swipers['swiper-'+index] = new Swiper('.swiper-'+index,{
      speed: speedVar,
      pagination: '.pagination-'+index,
      paginationHide:false,
      loop: loopVar,
      paginationClickable: true,
      autoplay: autoPlayVar,
      slidesPerView: slidesPerViewVar,
      autoHeight: autoHeight,
      keyboardControl: true, 
      simulateTouch: true,
      centeredSlides: centerVar,
      effect: slideEffect,
      direction: directMode,
      freeMode: freeMode,
      fade: {
        crossFade: false
      },
      coverflow: {
        rotate: 70,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows : false
      },
      onSlideChangeStart: function(swiper){
       var activeIndex = (loopVar===1)?swiper.activeLoopIndex:swiper.activeIndex;
       if ( $t.closest('.slider-swiching').length){
        swipers['swiper-'+$t.closest('.slider-swiching').find('.swich-parent').attr('id')].slideTo(swiper.activeIndex);
      }
    },
    onSlideChangeEnd: function(swiper){
      var activeIndex = (loopVar===1)?swiper.activeLoopIndex:swiper.activeIndex;
      $t.closest('.slider-swiching').find('.swich-parent .swiper-slide').removeClass('active');
      $t.closest('.slider-swiching').find('.swich-parent .slide-swich').parent().eq(activeIndex).addClass('active');
    }
  });
    swipers['swiper-'+index].update();
    initIterator++;
  });
  
  
}

initSwiper();               

$('.swiper-arrow-left').on('click', function(){
  swipers['swiper-'+$(this).closest('.arrow-closest').find('.swiper-container').attr('id')].slidePrev();
});
$('.swiper-arrow-right').on('click', function(){
  swipers['swiper-'+$(this).closest('.arrow-closest').find('.swiper-container').attr('id')].slideNext();
});


$(document).on('click','.slide-swich', function(){
  var swichIndex = $(this).closest('.slider-swiching').find('.slide-swich').index(this);
  $(this).closest('.slider-swiching').find('.slide-swich').removeClass('active');
  $(this).addClass('active');
  swipers['swiper-'+$(this).closest('.slider-swiching').find('.container-swich').attr('id')].slideTo(swichIndex);

});

/*============================*/
/* VIDEO YOUTUBE - VIMEO  */
/*============================*/

$(document).on('click', '.play-button', function(){
 var videoLink = $(this).attr('data-video'),
 thisAppend = $(this).closest('.video-open').find('.video-iframe');
 $(this).closest('.video-open').find('.video-item').addClass('act');
 $('.video-open').addClass('over');
 $('<iframe>').attr('src', videoLink).appendTo(thisAppend);
 return false;
});

$(document).on('click', '.close-video', function(){
  var videoClose = $(this).parent().find('.video-iframe');
  $(this).closest('.video-open').find('.video-item').removeClass('act');
  $('.video-open').removeClass('over');
  videoClose.find('iframe').remove();
  return false;
});

/*============================*/
/* WINDOW SCROLL  */
/*============================*/

$(window).scroll(function() {
  
  fixHeader(); 
  stikyHeader();
  
  if ($('.time-line').length) {
   $('.time-line').not('.animat').each(function(){
    if($(window).scrollTop() >= $(this).offset().top-$(window).height()*0.5)
      {$(this).addClass('animat').find('.timer').countTo();}});
 }

 if ($('.start-line').length){
  if($(window).scrollTop() >= $('.start-line').offset().top - $('.start-line').height()){
   $('.skill-line div').each(function(){
    var objel = $(this);
    var pb_width = objel.attr('data-width-pb');
    objel.css({'width':pb_width});
  });
 }
}

if ($('.fix-line').length){ 
  if ($(window).scrollTop() >= $('.offset-baner').height()){
    $('.fix-line').addClass('fixed');  
  }else{
    $('.fix-line').removeClass('fixed');
  }
}    
}); 

function fixHeader() {
  if ($(window).scrollTop() >= $('.header').height()) {
    $('.header').addClass('fix');
  }else{
    $('.header').removeClass('fix');
  }
}

function stikyHeader() {
  if ($(window).scrollTop() >= $('.full-height-baner').height()-$('.header').height()) {
   $('.header.type-3').addClass('stick');
 }else{
   $('.header.type-3').removeClass('stick');
 }
}

/*============================*/
/* WOW ANIMATION */
/*============================*/

if ($(window).width()>1200){
  var wow = new WOW(
  {
    boxClass:     'wow',
    animateClass: 'animated',
    offset:       0, 
    mobile:       true, 
    live:         true,       
    scrollContainer: null
  }
  );
  wow.init();
}

$('.dropdown-toggle').dropdown();


/*============================*/
/* CLICK  */
/*============================*/

$(document).on('click', '.mobile-menu', function(){
  $(this).toggleClass('active');
  $('body').toggleClass('overflow');
});

if ($(window).width() < 992 || $('body').hasClass('mobile-open')) {               
  $(document).on('click', '.drop-link > .icon', function(){
    $(this).parent().find('> .dropdown-menu').slideToggle(300);
    
  }); 
}

});
