var minCount = 1;
var maxCount = 6;

$(function(){
$('#problem-plus').on('click', function(){
  var inputCount = $('#problem-area .unit').length;
  if (inputCount < maxCount){
    var element = $('#problem-area .unit:last-child').clone(true);
    var inputList = element[0].querySelectorAll('input[type="text"]');
    for (var i = 0; i < inputList.length; i++) {
      inputList[i].value = "";
    }
    $('#problem-area .unit').parent().append(element);
  }
});
$('.problem-minus').on('click', function(){
  var inputCount = $('#problem-area .unit').length;
  if (inputCount > minCount){
    $(this).parents('.unit').remove();
  }
});
});
