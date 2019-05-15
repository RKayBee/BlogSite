<!DOCTYPE html>
<html>

<head>
    <title>Registration
    </title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
        crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="stylesheet/register.css">
    <script defer="true" src="javascript/registerScript.js"></script>

<body>
    <div class="main_container">
        <h1 id="heading">
            REGISTRATION
        </h1>
        <form name="myForm" action="Controller/registerProcess.cfm" method="POST">
            <div class="formelement">
                <div class="leftdiv">
                    <i class="fa fa-asterisk y"></i>
                    <label class="headlabel">Full Name</label>
                </div>
                <div class="rightdiv">

                    <input type="text" name="firstName" class="inputBox" placeholder="john">
                    <label class="sublabel ">First Name<i class="fa fa-asterisk"></i>
                    </label>
                    </fieldset>
                    <input type="text" name="middleName" class="inputBox" placeholder="shein">
                    <label class="sublabel">Middle Name</label>
                    <input type="text" name="lastName" class="inputBox" placeholder="doe">
                    <label class="sublabel">Last Name <i class="fa fa-asterisk"></i>
                    </label>
                </div>


                <div class="leftdiv">
                    <i class="fa fa-asterisk y"></i>
                    <label class="headlabel">Email</label>
                </div>
                <div class="rightdiv">
                    <input type="text"  name="email" class="inputBox"
                        placeholder="john8@gmail.com">
                    <label class="sublabel">example@example.com</label>
                </div>
                <div class="leftdiv">
                    <i class="fa fa-asterisk y"></i>
                    <label class="headlabel">Password</label>

                </div>
                <div class="rightdiv">
                    <input type="password" name="password" class="inputBox" id="pass">
                    <label class="sublabel">Password</label>
                    <a href="javascript:void(0)" class="fa fa-eye  eye"></a>



                </div>
                <div class="leftdiv">
                    <i class="fa fa-asterisk y"></i>
                    <label class="headlabel">Confirm Password</label>
                </div>
                <div class="rightdiv">
                    <input type="password" name="confirmPassword" class="inputBox">
                    <label class="sublabel"></label>
                    <a href="javascript:void(0)" class="fa fa-eye  eye"></a>

                </div>
                <div class="leftdiv">
                    <i class="fa fa-asterisk y"></i>
                    <label class="headlabel">Present Address</label>
                </div>
                <div class="rightdiv">
                    <textarea  name="streetAddress" class="inputBox"rows=4 cols="2"></textarea>
                    <label class="sublabel">Street Address</label>
                    <div class="leftdiv leftleftdiv">
                        <input type="text" name="presentCity" class="inputBox cityArea ">
                        <label class="sublabel ">City<i class="fa fa-asterisk"></i>
                        </label>
                        <input type="text" name="presentZip" class="inputBox cityArea">
                        <label class="sublabel">Postal Zip </label>
                    </div>
                    <div class="rightdiv rightrightdiv">
                        <select class="inputBox" style="width:100%;padding:1px" name="presentState">
                            <option value="0">Select State</option>
                            <option value="1"> United States </option>
                            <option value="2"> Afghanistan </option>
                            <option value="3"> Albania </option>
                            <option value="4"> Algeria </option>
                            <option value="5"> American Samoa </option>
                            <option value="6"> Andorra </option>
                            <option value="7"> Angola </option>
                            <option value="8"> Anguilla </option>
                            <option value="9"> Argentina </option>
                            <option value="10"> Armenia </option>
                        </select>
                        <label class="sublabel ">State or Province<i class="fa fa-asterisk"></i>
                        </label>
                        <select  class="inputBox" style="width:100%;padding:1px"name="presentCountry">
                            <option value="0">Select State</option>
                            <option value="1"> United States </option>
                            <option value="2"> Afghanistan </option>
                            <option value="3"> Albania </option>
                            <option value="4"> Algeria </option>
                            <option value="5"> American Samoa </option>
                            <option value="6"> Andorra </option>
                            <option value="7"> Angola </option>
                            <option value="8"> Anguilla </option>
                            <option value="9"> Argentina </option>
                            <option value="10"> Armenia </option>
                        </select>
                        <label class="sublabel" name="country">Country<i class="fa fa-asterisk"></i>
                        </label>

                    </div>
                </div>

                <div class="leftdiv">
                    <i class="fa fa-asterisk y"></i>
                    <label class="headlabel">Phone Number</label>

                </div>
                <div class="rightdiv">
                    <input type="text" name="areaCodeMain" class="inputBox areaCode half">
                    <label class="sublabel">Area Code</label>
                    <input type="text" name="phoneMain" class="inputBox" pattern="[0-9]{10}">
                    <label class="sublabel">Mobile Number</label>
                </div>

                <div class="leftdiv">
                    <label class="headlabel">Subscribe to Newsletter?</label>
                </div>
                <div class="rightdiv">
                    <input type="radio" name="newsletter" value="Y" checked >
                    <p> Yes</p>
                    <br>
                    <input type="radio" name="newsletter" value="N">
                    <p>No</p>
                    <br>
                </div>

            </div>
            <!--end of main form element-->
            <div class="submit clear">
                <input type="submit" value="Submit" name="submit" class="finalButton" id="submitButton">
                <input type="reset" value="Reset" class="finalButton">
            </div>
        </form>
    </div>
    <!--end of main container-->

</body>

</html>