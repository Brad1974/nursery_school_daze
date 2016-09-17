$(document).on("turbolinks:load", function(){
  // $('.nap').val("select")
  $('.nap').timepicker({ 'timeFormat': 'g:ia', 'disableTextInput' : true });
  $('.nap').timepicker('option', {'minTime': '1:00pm', 'maxTime': '5:00pm', 'step': '5' } );

  $('#nap_check').on('change', function(){
    // $('.nap').val("select")
    $('#nap_entry').toggle();
  })

});
