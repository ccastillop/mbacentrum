// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//datepickers

$(document).ready(function(){
  $('input[datepicker]').each(function(i){
    $(this).datepicker({
  		changeMonth: true,
  		changeYear: true,
  		minDate: $(this).attr('min'),
  		maxDate: $(this).attr('max'),
  	})
  });
});