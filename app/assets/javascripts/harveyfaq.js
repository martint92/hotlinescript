document.addEventListener("turbolinks:load", function() { 
  $('.qaa-title').on('click', function() {
    $(this).next().slideToggle(400);
    $(this).find('img').toggle();
  })
    $(".answers-box").hide(); 

});
