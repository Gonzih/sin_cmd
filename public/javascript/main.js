$(document).ready(function(){
  $('#main_form').submit(function(){
    $.post(
      $(this).attr('action'),
      $(this).serialize(),
      function(response) {
        if (response == 'ok') {
          load_list();
        }
      }
    )
    return false;
  })

  $('.killer').click(function(){
    $.post(
      $(this).attr('href'),
      function(response) {
        if (response == 'ok') {
          load_list();
        }
      }
    )
    return false;
  });
});

function load_list() {
  $('#list').load('/list/');
}
