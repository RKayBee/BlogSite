  //global variable
  var form = document.querySelector("form");
  var password =form.password;
  var confirmPassword = form.confirmPassword;
  var passwordLabel=password.nextElementSibling;
   var confirmPasswordLabel=confirmPassword.parentElement.querySelector("label");
  var firstName =form.firstName;
  var middleName = form.middleName;
  var lastName = form.lastName;
  var email =form.email;
  var emailLabel=email.nextElementSibling;
  var label =document.getElementById("captchaContent");
  var presentCity = form.presentCity;
  var streetAddress=form.streetAddress;
  var streetAddressLabel=streetAddress.nextElementSibling;
  var presentZip = form.presentZip;
  var areaCodeMain =form.areaCodeMain;
  var phoneMain = form.phoneMain;
  var submitButton = form.submit;
  var eye = document.querySelectorAll(".eye");
  var body = document.querySelector("body");
  var firstNameLabel=firstName.nextElementSibling;
  var middleNameLabel=middleName.nextElementSibling;
  var lastNameLabel=lastName.nextElementSibling;
  var presentState=form.presentState;
  var presentCountry=form.presentCountry;
  var zipPattern=/[1-9][0-9]{4,5}/;
  var areaCodePattern=/^[0-9]{2}([\-][0-9]{3,4})?$/;
  var cityPattern=/^[a-zA-Z]+$/; 
  var streetAddressPattern=/^[a-zA-Z0-9 /,]+([/-]+[a-zA-Z0-9 /,/.]*)$/;
  var phonePattern=/^[1-9][0-9]{9}$/;
  var namePattern=/^[a-zA-Z]+(\'?[a-zA-Z]+)?$/ ;
  var emailPattern=/^[a-zA-Z]*[a-zA-Z0-9\_\.]*[a-zA-Z][\@]([a-zA-Z]+[\.])+[a-zA-Z]+$/;
  var selectMessage="Select an Option";
  var zipMessage="zip can be a five or six digited number "
  var areaCodeMessage="Area Code can take minimum two digits and  optional hyphen (\"-\") followed by a minimum three and maximum of four digits)";
  var cityMessage="City Name can take only Alphabetic Values."
  var phoneMessage="Mobile Number can take 10 digits only.It cannot begin with a zero(0)";
  var nameMessage="Name cannot take space,undefined symbols,digits, begin or end with an apostrophe .";
  var emailMessage="Email cannot take space.It can take combination of alphabets,periods and digits.It can begin and end with aplhabet only.";
  var streetAddressMessage="street address can take combinaion of alphabets,numbers,hyphen,space,comma etc."
  //global variable
  //eventListeners

  form.onsubmit = validateForm;
  eye[0].addEventListener("click", function () {
    showHidePass(eye[0]);
  });
  eye[1].addEventListener("click", function () {
    showHidePass(eye[1]);
  });
 
  firstName.addEventListener("blur",function()
  {
     validateInputEmpty(firstName,firstNameLabel,nameMessage,namePattern)
  });
  middleName.addEventListener("change",function()
  {
     validateInput(middleName,middleNameLabel,nameMessage,namePattern)
  });
  lastName.addEventListener("blur",function()
  {
     validateInputEmpty(lastName,lastNameLabel,nameMessage,namePattern)
  });
  password.addEventListener("input", function () {
    eyeVisible(eye[0]);
  });
  
  confirmPassword.addEventListener("input", function () {
    eyeVisible(eye[1]);
  });
  password.addEventListener("blur",validatePassword);
  confirmPassword.addEventListener("blur",validateConfirmPassword);

  email.addEventListener("blur",function()
  {
    validateInputEmpty(email,emailLabel,emailMessage,emailPattern)
  });
  phoneMain.addEventListener("blur",function()
  {
    validateInputEmpty(phoneMain,phoneMain.nextElementSibling,phoneMessage,phonePattern)
  });
 
  presentZip.addEventListener("blur",function()
  {
    validateInput(presentZip,presentZip.nextElementSibling,zipMessage,zipPattern)
  });
  streetAddress.addEventListener("blur",function()
  {
	 validateInputEmpty(streetAddress,streetAddressLabel,streetAddressMessage,streetAddressPattern) 
  });
 
  presentCity.addEventListener("blur",function()
  {
    validateInputEmpty(presentCity,presentCity.nextElementSibling,cityMessage,cityPattern)
  });
  
  areaCodeMain.addEventListener("blur",function()
  {
    validateInputEmpty(areaCodeMain,areaCodeMain.nextElementSibling,areaCodeMessage,areaCodePattern)
  });
 
  presentState.addEventListener("change",function()
  {
    validateSelectEmpty(presentState,presentState.nextElementSibling,selectMessage);
  });
  presentCountry.addEventListener("change",function()
  {
    validateSelectEmpty(presentCountry,presentCountry.nextElementSibling,selectMessage);
  });
  

  //function definition begining
  function validateSelectEmpty(Name,NameLabel,Message)
  {
    if(Name.value=="")
    {
      
  
     Name.classList.add("errorRed");
     NameLabel.classList.add("errorMessage");
    NameLabel.innerText=Message;
    return false;
  }
  else
    {
      if(Name.classList.contains("errorRed"))
      {
       Name.classList.remove("errorRed");
       Name.classList.add("validGreen");
       NameLabel.classList.remove("errorMessage");
       NameLabel.classList.add("validMessage");
        NameLabel.innerText="Accepted";
      }
      else if(Name.classList.contains("validGreen"))
      {   
        Name.classList.remove("validGreen");
        NameLabel.classList.remove("validMessage");
        NameLabel.classList.add("sublabel");
         
      }
      else
       NameLabel.classList.add("sublabel");
      return true;
    }
}
 
  function validateInputEmpty(Name,NameLabel,message,pattern) 
  {
    if (Name.value=="")
    {  
      if(Name.classList.contains("validGreen"))
      { 
      Name.classList.remove("validGreen");
        NameLabel.classList.remove("validMessage");
        NameLabel.classList.add("sublabel");
      }
  
      Name.classList.add("errorRed");
      NameLabel.innerText="Enter Value";
      NameLabel.classList.add("errorMessage");
      return false;
    }
   if( validateInput(Name,NameLabel,message,pattern)== true)
   return true;
   else 
   return false;
  }
   function validateInput(Name,NameLabel,message,pattern)
   {
    if (!(pattern.test(Name.value)))
    { 
      if(Name.classList.contains("validGreen"))
      { 
      Name.classList.remove("validGreen");
        NameLabel.classList.remove("validMessage");
        NameLabel.classList.add("sublabel");
      }
      Name.classList.add("errorRed");
      NameLabel.innerText=message;
      NameLabel.classList.add("errorMessage");
      return false;
    }
    else
    {
      if(Name.classList.contains("errorRed"))
      {
       Name.classList.remove("errorRed");
       Name.classList.add("validGreen");
       NameLabel.classList.remove("errorMessage");
       NameLabel.classList.add("validMessage");
        NameLabel.innerText="Accepted";
       
        //return true;
      }
      else if(Name.classList.contains("validGreen"))
      {   
        Name.classList.remove("validGreen");
        NameLabel.classList.remove("validMessage");
        NameLabel.classList.add("sublabel");
         
      }
      else
      
      NameLabel.classList.add("sublabel");
      return true;
    }
  }//end of pattern validation
  
  function eyeVisible(eye) {
    //makes eye icon visible
    eye.style.display = "inline-block";
  }

 function validatePassword()
 {
   
  if(/\s/.test(password.value))
    {
  passwordLabel.innerText="password cannot take space";
  passwordLabel.classList.add("errorMessage");
  password.classList.add("errorRed");
  return false;
   }
  else
  {
           if(confirmPassword.value !="" && password.value=="")
            {
             
              passwordLabel.innerText="Enter a password";
              password.classList.add("errorRed");
              passwordLabel.classList.add("errorMessage");
              return false;
            }
            if(password.value=="")
            {
             
              passwordLabel.innerText="Enter a password";
              password.classList.add("errorRed");
              passwordLabel.classList.add("errorMessage");
             
              return false;
            } 

            if (password.value.length <5 )
            {
            confirmPassword.value="";
            passwordLabel.innerText="Use 5  characters or more for your password";
            password.classList.add("errorRed");
            passwordLabel.classList.add("errorMessage");
            return false;
            }
          else//if password length >5 it goes inside the if
          {
             if (password.classList.contains("errorRed"))
             {
              password.classList.add("validGreen");
              passwordLabel.classList.add("validMessage");
              passwordLabel.innerText="valid";
              }
          else
            { 
            passwordLabel.innerText="valid";
            }
          if(confirmPassword.value!="")
         { 
           if(validateConfirmPassword()==true)
           return true;
           else 
           return false; 
         
         }
        }
      }
    }//end of validatePassword
 function validateConfirmPassword()
          {
            if(/\s/.test(confirmPassword.value))
            {
          confirmPasswordLabel.innerText="password cannot take space";
          confirmPasswordLabel.classList.add("errorMessage");
          confirmPassword.classList.add("errorRed");
          return false;
           }
          else
          {
            if(password.value=="")
            {
             
              passwordLabel.innerText="Enter a password";
              password.classList.add("errorRed");
              passwordLabel.classList.add("errorMessage");
             password.focus();
              return false;
            } 
             if(confirmPassword.value=="")
            {
              confirmPassword.classList.add("errorRed");
              
            confirmPasswordLabel.innerText="confirm your Password";
            confirmPasswordLabel.classList.add("errorMessage");
           
            return false;
            }

         else if(confirmPassword.value!=password.value )
          {   
            if(confirmPassword.classList.contains("validGreen"))
            {
              confirmPassword.classList.remove("validGreen");
              confirmPasswordLabel.classList.remove("validMessage");
            }
            confirmPassword.classList.add("errorRed");
            confirmPasswordLabel.classList.add("errorMessage");
            confirmPasswordLabel.innerText="Those passwords didn't match.Try again";
            
              return false;
            }
            else
            {
              if (confirmPassword.classList.contains("errorRed"))
              {
                confirmPassword.classList.remove("errorRed");
              confirmPassword.classList.add("validGreen");
             confirmPasswordLabel.classList.add("validMessage");
           confirmPasswordLabel.innerText="Match";
              return true;
              }
              else
              {
                
                confirmPasswordLabel.innerText="Match";
                   return true;
              }
            }

        }
      }
  function showHidePass(eye) //toggle between show and hide password on clicking eye icon
   {
     var parent = eye.parentElement;
     var input = parent.querySelectorAll("input");
     if (input[0].type === "password") {
      input[0].type = "text";
      eye.className = eye.className.replace("fa-eye", "fa-eye-slash");
    } else {
      input[0].type = "password";
      eye.className = eye.className.replace("fa-eye-slash", "fa-eye");
    }
  } //end of show pass  
  function validateForm() //validation of full form ,called on form submit
  {
    var flag= true;
    if (!validateInputEmpty(firstName,firstNameLabel,nameMessage,namePattern))
     {
       
      flag= false;
    }
    if (!validateInputEmpty(lastName,lastNameLabel,nameMessage,namePattern))
     {

     flag= false;
    }
    if(middleName.value!="")
    {
    if (!validateInput(middleName,middleNameLabel,nameMessage,namePattern))
     {
      flag= false;
    }
  }
    if(!validatePassword())
    {
     
      flag= false;
    }
    if(!validateConfirmPassword())
    {
     
      flag= false;
    }
    if(!validateInputEmpty(email,emailLabel,emailMessage,emailPattern))
    {
     
      flag= false;
    }
    if(!validateInputEmpty(phoneMain,phoneMain.nextElementSibling,phoneMessage,phonePattern))
    {
     
      flag= false;
    }
    
    if(!validateInputEmpty(presentCity,presentCity.nextElementSibling,cityMessage,cityPattern))
  {
    flag=false;
  }
  if(presentZip.value!="")
  {
  if(!validateInput(presentZip,presentZip.nextElementSibling,zipMessage,zipPattern))
  
    flag=false;
  }
 
  if(!validateInputEmpty(areaCodeMain,areaCodeMain.nextElementSibling,areaCodeMessage,areaCodePattern))
  {
    flag=false;
  }
if(! validateInputEmpty(streetAddress,streetAddressLabel,streetAddressMessage,streetAddressPattern))
{
	flag=false;
}
if(!validateSelectEmpty(presentState,presentState.nextElementSibling,selectMessage))
{
flag=false;
}

if(!validateSelectEmpty(presentCountry,presentCountry.nextElementSibling,selectMessage))
{
  flag=false;
}

    
    if(flag===false)
    return false;
    else 
    return true;
  }