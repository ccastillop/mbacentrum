/*
* Unobtrusive autocomplete
*
* To use it, you just have to include the HTML attribute autocomplete
* with the autocomplete URL as the value
*
*   Example:
*       <input type="text" autocomplete="/url/to/autocomplete">
*       
*/

$(document).ready(function(){
  $('input[autocomplete]').each(function(i){
    $(this).autocomplete({
      source: $(this).attr('autocomplete'),
      //select: function(event, ui){
                //ajustamos el ID al valor seleccionado
                //$("#"+$(this).attr('to')).val(ui.item.id);
              //}
      });
  });
});