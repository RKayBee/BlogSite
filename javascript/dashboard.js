$(document).ready(function(){
    $(".EditPost").on('click',function(){
    //take to edit profile page
    });
    $(".navLinks").on('click',function(event){
        $(this).
    })
    $(".WritePost").on('click',function(){
            if($("#newPost").val()==='')
            $(".postError").html="Please write something."
            else
            {
                $.ajax({
                    type: 'POST',
                    data: {
                        post: $("#newPost").val(),
                        password: $("input[name='password']").val(),
                    },
                    url: 'Component/authenticationService.cfc?method=doLogin',
                    async: true
                }).done(function (response) {
                    console.log(response);
                    if (JSON.parse(response) === true) {
                        window.location = "home.cfm";
                        window.URL = "home.cfm"
                    } else {
                        $('#login-error-msg').css('display', 'block');
                        $('#login-error-msg').html("*Username or Password do not match");
                    }
                });
            } 
        });
            
            });