$(document).on('mouseover', '.rating .fa-star', function () {
  let rate = $(this).attr('data-star');
  let star_dom = $('.rating .fa-star');
  star_dom.removeClass('active');
  for (let i = 0; i < rate; i++) {
    star_dom.eq(i).addClass('active');
  }
  $('#rating').val(rate); 
});
