document.addEventListener("turbolinks:load", function() { 
  $('.qaa-title').on('click', function() {
    $(this).next().slideToggle(400);})
    $(".answers-box").hide(); 
});
