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
  load_library();
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

function init_library() {
  $('.dir').click(function(){
    $(this).next().next('.level').slideToggle('fast');
    return false;
  });

  $('.file').click(function(){
    var file = $(this).attr('href');
    var href = "/run/?cmd=mplayer -fs '" + file + "'";
    $.post(href, load_list)
    return false;
  });
}

function load_library(extensions) {
  if (!extensions) extensions = ''
  $('#files_library').load('/library/?extensions=' + extensions, init_library);
}
