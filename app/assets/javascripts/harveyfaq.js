function main() {
	$('.answers-box').hide();
  $('.qaa-box').on('click', function() {
    $(this).next().slideToggle(400);
  });
}
document.addEventListener("turbolinks:load", function() { alert("ok!") });