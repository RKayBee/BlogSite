$(document).ready(function(){
$("#post-it").on('click',function()
{
    
    if (validateForm()) {
        //    ajax call to database
         
         var title= $("input[id='title-content']").val();
        $.ajax({
            type: 'POST',
           
           data:
          {
             title: $("input[id='title-content']").val(),
             post : $("#post-content").val(),
             tag:$("#category-list").val(),
         }
           ,
            url: 'Component/postAction.cfc?method=addPost',
            async: true,
        }).done(function (response) {
            if (JSON.parse(response) === true) {
                window.location = "dashboard.html";
                window.URL = "dashboard.html"
            } 
        });
    } else
        return false;

});

});
function validateTitleNotEmpty() {
    if ( $("input[id='title-content']").val() === '') {
        $("#error-title-message").text("Please,add a title to your post");
        return false;
    } else
        return true;
}
function validatePostContentNotEmpty() {
    if ( $("#post-content").val() === '') {
        $("#error-post-content-message").text("Please,add content to your post");
        return false;
    } else
        return true;
}
function tagNotEmpty() {
    if ($("#category-list").val() === 0) {
        $("#error-tag-list-message").html("Please,select a category");
        return false;
    } else
        return true;
}

function validateForm() //validation of full form ,called on form submit
{
    var flag=true;
        if ( !validateTitleNotEmpty())
        flag=false;
        if ( !validatePostContentNotEmpty())
        flag=false;    
        if ( !tagNotEmpty() )
        flag=false;
        return flag;
}