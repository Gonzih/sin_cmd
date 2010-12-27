$(document).ready(function(){
  $('#main_form').submit(function(){
    $.ajax({
      url: $(this).attr('action'),
      data: $(this).serialize(),
      type: 'post',
      success: function(response) {
        if (response == 'ok') {
          load_list();
        }
      }
    })
    return false;
  })

  init_killers()
});

function load_list() {
    $.ajax({
        url: '/list/',
        type: 'post',
        success: function(data){
            $('#list').html(data);
            init_killers();
        }
    })
}

function init_killers() {
    $('.killer').click(function(){
    $.ajax({
      url: $(this).attr('href'),
      type: 'post',
      success: function(response) {
        if (response == 'ok') {
          load_list();
        }
      }
    })
    return false;
  });
}
