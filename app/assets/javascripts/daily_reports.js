$(document).on("turbolinks:load", function(){

  setInput();
  setUpTimePicker();
  toggleNapFields();
  deleteBeforeSubmit();

  matchHeight();

  hideNarratives();

  addNarrative();






});

function hideNarratives(){
  if ($('textarea').length > 0){

  if ($('textarea[name="daily_report[narrative1]"').val().length == 0)
  { $('textarea[name="daily_report[narrative1]"').hide() }

  if ($('textarea[name="daily_report[narrative2]"').val().length == 0)
  { $('textarea[name="daily_report[narrative2]"').hide() }

  if ($('textarea[name="daily_report[narrative3]"').val().length == 0)
  { $('textarea[name="daily_report[narrative3]"').hide() }


  if ($('textarea[name="daily_report[narrative4]"').val().length == 0)
  { $('textarea[name="daily_report[narrative4]"').hide() }
}
}

function addNarrative(){
  $('.add-narr').on('click', function(){
    if ($('textarea[name="daily_report[narrative3]"').val().length > 0)
      {$('textarea[name="daily_report[narrative4]"').show() }
    if ($('textarea[name="daily_report[narrative2]"').val().length > 0)
      {$('textarea[name="daily_report[narrative3]"').show() }
    if ($('textarea[name="daily_report[narrative1]"').val().length > 0)
      {$('textarea[name="daily_report[narrative2]"').show() }
    if ($('textarea[name="daily_report[narrative]"').val().length > 0)
      {$('textarea[name="daily_report[narrative1]"').show() }
  });
};

function matchHeight(){
  var heights = $('.report').map(function() {
  return $(this).height();
  }).get(),
   maxHeight = Math.max.apply(null, heights);
   $('.report').height(maxHeight);
}


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
