$(document).on("turbolinks:load", function(){

  setInput();
  setUpTimePicker();
  toggleNapFields();
  deleteBeforeSubmit();

});

function setInput(){
  $('.nap').each(function(){
    if ( $(this).val() === "3:00am" ) { $(this).val("select")}
  })
  if ( $('.nap:last').val() === $('.nap:first').val() )
    {$('.nap').val("select")};
  if ($('#nap_check').is(":checked"))
    { $('#nap_entry').hide()}
  };

function setUpTimePicker(){
  $('.nap').timepicker({ 'timeFormat': 'g:ia', 'disableTextInput' : true });
  $('.nap').timepicker('option', {'minTime': '1:00pm', 'maxTime': '5:00pm', 'step': '5' } );
}

function toggleNapFields(){
  $('#nap_check').on('change', function(){
    $('#nap_entry').toggle();
  })
};

function deleteBeforeSubmit(){
  $('form[class=new_daily_report], form[class=edit_daily_report]').on('submit', function(e){
    e.preventDefault;
    if ($('#nap_check').is(":checked"))
      { $('.nap').val("3:00am") };
    if (!$('#nap_check').is(":checked"))
      { $('.nap').each(function(){
        if ( $(this).val() === "select" ) { $(this).val("3:00am")}
      })
    }
    this.submit
  });
};
