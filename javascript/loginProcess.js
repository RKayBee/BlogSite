
var emailPattern = /^[a-zA-Z]*[a-zA-Z0-9\_\.]*[a-zA-Z][\@]([a-zA-Z]+[\.])+[a-zA-Z]+$/;
$(document).ready(function () {

    $(".login-button").on('click', function () {
            if (validateForm()) {
                //    ajax call to database
                $.ajax({
                    type: 'POST',
                    data: {
                        email: $("input[name='email']").val(),
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
            } else
                return false;
        });
    

});

function validateEmailNotEmpty() {
    if ( $("input[name='email']").val() === '') {
        $("#error-email-message").text("Please,enter a valid email address");
        return false;
    } else
        return true;
}

function validateEmail() {
    if (!emailPattern.test($("input[name='email']").val())) {
        $("#error-email-message").text("Please,enter a valid email");
        return false;
    } else
        return true;

}

function passwordNotEmpty() {
    if ($("input[name='password']").val() === '') {
        $("#error-password-message").html("Please,enter a password");
        return false;
    } else
        return true;
}

function validateForm() //validation of full form ,called on form submit
{
    var flag=true;
        if ( !validateEmailNotEmpty() )
        flag=false;
        if ( !validateEmail() )
        flag=false;    
        if ( !passwordNotEmpty() )
        flag=false;
        return flag;
}