<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>i Shop BD</title>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="css/placeholder-loading.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" type="text/css" rel="stylesheet">    
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <link href="css/signup.css" type="text/css" rel="stylesheet">

    <?php 
            if (isset($_SESSION['u_id']) && isset($_SESSION['u_logedin']) ) {
                header('Location: index.php');
            }
    ?>
</head>
<body>
    <?php 
    require 'views/navbar.php'; 
    require 'include/dbh.inc.php';
    ?>

    <div class="main-container">
    <?php require 'views/nav.php'; ?>

      <div id="maincontent" class="main-content">



        <div class="container-fluid">



            <div class="container sign-up-container">

                <div class="wrapper">

                    <div class="signup">
                        <div class="bg">
                                <span class="title">
                                        Sign Up
                                </span>
                        </div>
                        <form action="include/signupexe.php" method="POST" class="form">
                        <div style="width: 100%;">

                            <div class="form_group">
                                    <span class="lebel">First Name</span>
                                    <input class="input100" id="fname" type="text" name="first" autocomplete="off" onkeyup="validate(this)" required placeholder="Enter Your First Name">
                                
                            </div>
                            <div class="msg"></div>                      
                        </div>
                            
                        <div style="width: 100%;">
                            <div class="form_group">
                                    <span class="lebel">Last Name</span>
                                    <input class="input100" id="lname" type="text" name="last" autocomplete="off" onkeyup="validate(this)" required placeholder="Enter Your Last Name"><br>
                            </div>
                            <div class="msg"></div>
                        </div>
                            <!-- <div class="form_group">
                                    <span class="lebel">User Name</span>
                                    <input class="input100" id="uname" type="text" name="uname" oninvalid="invalid(this.id)" onblur="validate(this.id)" required placeholder="Enter a Uniqe User Name"><br>
                            </div> -->
                        <div style="width: 100%;">
                            <div class="form_group">
                                <span class="lebel">Email</span>
                                <input class="input100" id="email" type="email" name="email" autocomplete="off" onkeyup="validate(this)" required placeholder="Enter E-mail">
                                <br>
                            </div>
                            <div class="msg"></div>
                        </div>
                            <!-- <div class="form_group">
                            <span class="lebel">Gender</span>
                            <input type="radio" name="gender"  value="male" required>
                            <label id="male">Male</label>
                            <input type="radio" name="gender"  value="female" required>
                            <label id="female">Female</label>
                            </div> -->
                        <div style="width: 100%;">                            
                            <div class="form_group">
                                <span class="lebel">Address</span>
                                <textarea class="input100" name="address" id="address" autocomplete="off" onblur="validate(this)" placeholder="Enter Your Pressent Address"></textarea><br>
                            </div>
                            <div class="msg"></div>
                        </div>
                        <div style="width: 100%;"> 
                            <div class="form_group">
                                <span class="lebel">Zip Code</span>
                                <input class="input100" id="zip" type="text" name="zip" autocomplete="off" onkeyup="validate(this)" placeholder="Enter Your Area Zip Code">
                                <br>
                            </div>
                            <div class="msg"></div>
                        </div>
                        <div style="width: 100%;"> 
                            <div class="form_group">
                                <span class="lebel">Phone Number</span>
                                <input class="input100" id="phone" type="text" name="phone" autocomplete="off" onkeyup="validate(this)" placeholder="Enter Phone Number">
                                <br>
                            </div>
                            <div class="msg"></div>
                        </div>
                            <!-- <div class="form_group">
                            <span class="lebel">Country</span>
                            <select class="input100" id="country" name="country" onblur="validate(this.id)" class="country" >
                                <option value="bn" selected >Bangladesh</option>
                                <option value="us">United States</option>
                                <option value="uk">United Kingdom</option>
                                <option value="in">India</option>
                                <option value="pk">Pakistan</option>
                                <option value="ca">Canada</option>
                                <option value="ru">Rusia</option>
                            </select><br>
                            </div> -->
                            
          
                            <!-- <div class="form_group">
                                <span class="lebel">Profile Picture</span>
                                <input class="input100" id="pic" type="file" name="pictue" oninvalid="invalid(this.id)" onblur="validate(this.id)" placeholder="Profile Picture" >
                                <br>
                            </div> -->
                        <div style="width: 100%;"> 
                            <div class="form_group">
                                <span class="lebel">Password</span>
                                <input class="input100" id="pwd" type="password" name="pwd" autocomplete="off" onkeyup="validate(this)" onblur="passMatch()" required placeholder="Password"><br>
                            </div>
                            <div class="msg"></div>
                        </div>
                        <div style="width: 100%;"> 
                            <div class="form_group">
                                <span class="lebel">Confirm Password</span>
                                <input class="input100" id="pwd1" type="password" name="pwd1" autocomplete="off" onkeyup="passMatch()" required placeholder="Confirm Password"><br>
                            </div>
                            <div class="msg"></div>
                        </div>
                  
                            <input type="submit" id="submit" name="submit" value="Sign Up">
                            
                        </form>
                    </div>
                </div>
            </div>


          <div class="section">
            <h3 class="section-heading">
            </h3>
          </div>
    </div>

    <?php include 'views/footer.php'; ?>
    </div>





    <script src="js/jquery-3.2.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>

    <script>
        // function invalid(id) {
        //     var elmnt = document.getElementById(id);
        //     // elmnt.style.boxShadow = "0 0 3px 0 red";
        //     elmnt.style.borderBottom = "3px solid red";
        
        // }


        // function validate(id) {
        //     var elmnt = document.getElementById(id);
        // //if not null------------------------------------------------
        //     if (elmnt.value != "") {




        //         if (elmnt.id == "uname" || elmnt.id == "fname" || elmnt.id == "lname" ) {
        //             elmnt.style.borderBottom = "3px solid #57b846";
        //         } 

    
        //             else if (elmnt.id == "email") { //if email---------------
        //                 if (elmnt.value.indexOf("@") > 0) {

        //                     if (elmnt.value.indexOf(".") > 0) {
        //                         elmnt.style.borderBottom = "3px solid #57b846";
        //                     } else {
        //                     elmnt.style.borderBottom = "3px solid red";
        //                     }

        //                 } else {
        //                     elmnt.style.borderBottom = "3px solid red";
        //                 } 
        //             }//end if email_____________________


        //                     else if (elmnt.id == "pwd") { //if password----------------
        //                     if ( elmnt.value.length < 6) {
        //                         elmnt.style.borderBottom = "3px solid red";
        //                     } else {
        //                     elmnt.style.borderBottom = "3px solid #57b846";
        //                     }

        //             } //end if password______________
        //             else if (elmnt.id == "pwd1")  { //if confirm password----------
        //                 var pwd = document.getElementById("pwd");
        //                 if ( elmnt.value == pwd.value) {
        //                     elmnt.style.borderBottom = "3px solid #57b846";
        //                 } else {
        //                     elmnt.style.borderBottom = "3px solid red";
        //                 }
        //             } //end if confirm password________________ 

        //             else if (elmnt.id == "address") { // if address--------
        //                 elmnt.style.borderBottom = "3px solid #57b846";
        //             } //end if address__________
        //             else if (elmnt.id == "country") {//if country---------
        //                 elmnt.style.borderBottom = "3px solid #57b846";
        //             }
                    
        //             else if (elmnt.id == "pic") {//if file---------
        //                 elmnt.style.borderBottom = "3px solid #57b846";
        //             }

        //             else if (elmnt.id == "dob") {//if date---------
        //                 elmnt.style.borderBottom = "3px solid #57b846";
        //             }
                    
        //             else {
        //                 elmnt.style.borderBottom = "1px solid #b2b2b2";
        //             }


        // //end if not null____________________________________________

                
        //     }  else {
        //         elmnt.style.borderBottom = "1px solid #b2b2b2";
        //     }
            
        // }

    </script>

    <script>


        function validate(elmnt) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {

                if (this.readyState == 4 && this.status == 200) {
                    // callback(this, elmnt);
                    var msg = elmnt.parentElement.parentElement.lastElementChild;
                    console.log(elmnt);
                    console.log(msg);
                    console.log(this.responseText);
                    msg.innerHTML = this.responseText;
                    if (msg.innerText == "") { 
                        elmnt.classList.add('valid');
                    } else {
                        elmnt.classList.remove('valid');
                        elmnt.classList.add('invalid');
                    }
                    
                }
            }
            var url = '/i-ShopBD/include/validate.php?value='+elmnt.value+'&input='+elmnt.name;
            xhttp.open("GET", url, true);
            xhttp.send();
        }

        function passMatch () {
            var pwd = document.getElementById('pwd');
            var pwd1 = document.getElementById('pwd1');
            if (pwd1.value) {

        
                if (pwd.value == pwd1.value) {
                    pwd1.classList.remove('invalid');
                    pwd1.classList.add('valid')
                } else {
                    pwd1.classList.remove('valid');
                    pwd1.classList.add('invalid');
                }
            }
        }
    </script>
</body>
</html>
