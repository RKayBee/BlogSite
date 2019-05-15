<!DOCTYPE html>
<html>
    <head>
            <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
            <link rel="stylesheet" type="text/css" href="stylesheet/login.css">
			 <script language="javascript" src="javascript/loginStyle.js"></script>
			  <script language="javascript" src="javascript/loginProcess.js"></script>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>

<div class="main-container" id="main-container">
  <div class="modal">
    <div class="modal-left flex-group">
      <div id="login-content">
       <span id="login-header">Login
      </span>
        <span id="login-info"><label id="tag">Join the Party!</label><br>Get access to millions of mindboggling Ideas,Information and Creations.</span>
      <span id="logo-footer">
                 <!-- <img id="logo-image" src="images/sideLogo1.png" alt="logo"> -->
        </span>

    </div>
    </div>
  <div class="modal-right flex-group">

    <div id="user-credentials-box">
     <div id="login-error-msg"></div>
    <img class="close-Button" id="closeButton" src="images/cross1.png" alt="cross button" >
      <div class="form-element" id="email-box" style=" top: 10%">
                    <label class="label-in ">Enter Email</label>
                    <input type="text" name="email"class="input-box">
                    <div class="under-line"></div>
                    <div id="error-email-message" class="error"></div>
                  </div>
                  <a href="#"><span id="change-option" class="toggle-on-continue">Change?</span></a>

                  <div class="form-element"id="password-box" style=" top: 30% ">
                        <label class="label-in ">Enter Password</label>
                        <input type="password" name="password"class="input-box">
                        <div class="under-line"></div>
                        <div class="error" id="error-password-message"></div>
                      </div>
     <div id="button-box"style="top:50%">
            <button  class="button continue-button login-button" id="orangeButton" >
                    CONTINUE
                </button>
     </div>
 <a href="register.cfm"> <span class="modal-right-footer">Not a Member?Join the Nation</span></a>
    </div>

  </div>
</div>
</div>
</body>
</html>
