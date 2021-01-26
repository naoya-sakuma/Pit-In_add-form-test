var minCount = 1;
var maxCount = 6;

$(function(){
$('#test-plus').on('click', function(){
  var inputCount = $('#test-area .unit').length;
  if (inputCount < maxCount){
    var element = $('#test-area .unit:last-child').clone(true);
    var inputList = element[0].querySelectorAll('input[type="text"]');
    for (var i = 0; i < inputList.length; i++) {
      inputList[i].value = "";
    }
    $('#test-area .unit').parent().append(element);
  }
});
$('.test-minus').on('click', function(){
  var inputCount = $('#test-area .unit').length;
  if (inputCount > minCount){
    $(this).parents('.unit').remove();
  }
});
});
