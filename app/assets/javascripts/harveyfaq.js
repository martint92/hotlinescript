function main() {
	('.answers-box').hide();
  ('.qaa-box').on('click', function() {
    $(this).next().slideToggle(400);
    console.log('test');
  });
}

$(document).on('turbolinks:load', function(main)