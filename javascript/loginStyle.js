
$(document).ready(function(){
$(".input-box").on('focus',function(){
  if($(this).val()==='')
  $(this).parent().find("label").addClass("label-out").removeClass("label-in");
  $(this).next().css('width','90%');
});
$(".input-box").on('blur',function(){
  if($(this).val()==='')
  $(this).parent().find("label").removeClass("label-out").addClass("label-in");
   $(this).next().css('width','0%');
  
});
$(".label-in").on('click',function()
{
 $(this).parent().find(".input-box").focus();          
 });
 $("span#change-option").on('click',function(){
$("input[name='email']").val("");
});
$("#closeButton").on('click',function(){
    $("#main-container").css('display','none');
 $("input[name='password']").val();
$("input[name='password']").val();
});
});
