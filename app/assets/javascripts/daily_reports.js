$(document).on("turbolinks:load", function(){

  $('.nap').timepicker({ 'timeFormat': 'g:ia' });
  $('.nap').timepicker('option',{'minTime': '1:00pm', 'maxTime': '5:00pm', 'step': '5'} );

});
