jQuery(document).ready(function($) {
  $(".scroll").click(function(event){		
    event.preventDefault();
    $("html,body").animate({scrollTop:$("#home").offset().top},1000);
  });
});
