$(document).ready(function(){
  $('#main_form').submit(function(){
    loader();
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
            $('#list *').hide();
            $('#list *').fadeIn('slow');
            init_killers();
        }
    })
}

function init_killers() {
    $('.killer').click(function(){
    loader();
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

function loader() {
    $('#list').html('<center><img src="/images/loader.gif" /></center>');
}
