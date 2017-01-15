$(document).on("turbolinks:load", function(){

  setInput();
  toggleNapFields();
  matchHeight();
  hideNarratives();
  addNarrative();

});

function hideNarratives(){
  if ($('textarea').length > 0)
  {
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
  if ($('#nap_check').is(":checked"))
    { $('#nap_entry').hide()}
  };

function toggleNapFields(){
  $('#nap_check').on('change', function(){
    $('.nap').each(function(){
      $(this).val("")
    });
    $('#nap_entry').toggle();
  });
};
