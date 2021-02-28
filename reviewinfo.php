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

</head>
    <?php 
            if (!isset($_SESSION['u_id']) || !isset($_SESSION['u_logedin']) ) {
                header('Location: login.php');
            }
    ?>
<body style="background: #f6f6f6;" >
    <?php 
    require 'views/navbar.php'; 
    require 'include/dbh.inc.php';
    ?>

    <div class="main-container">
    <?php require 'views/nav.php'; ?>


      <div id="maincontent" class="main-content">



        <div class="container-fluid">
            <div class="section">
                <div class="section-heading"></div>
            </div>

            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-shopping-cart"></i>
                            Cart
                        </h3>
                    </div>
               
                    <div class="panel-body">
                                                <?php
                                                    if(isset($_GET['uid'])) {
                                                        $uid = $_GET['uid'];
                                                        $squ = "SELECT * FROM `users` WHERE user_id = '$uid'";
                                                        $rsu = $conn->query($squ);
                                                        $user = $rsu->fetch_assoc();
                                                    }
                                                ?>
                        <form action="include/reviewinfoexe.php" method="post" class="form">
                        <div class="row">

                            <div class="col-md-8">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-user"></i> Customer Details</h3>
                                    </div>
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                <td style="width: 1%;"><button  class="btn btn-info btn-xs" ><i class="fa fa-user fa-fw"></i></button></td>
                                                <td>
                                                    <div class="row">
                                                    <div class="form_group col-md-6">
                                                            <input class="input100" id="fname" type="text" name="first" value="<?php echo $user['first_name'] ?>" autocomplete="off" onkeyup="validate(this)" required>
                                                    </div>
                                                    <div class="msg"></div>      
                                                    <div class="form_group col-md-6">
                                                            <input class="input100" id="lname" type="text" name="last" value="<?php echo $user['last_name'] ?> " autocomplete="off" onkeyup="validate(this)" required>
                                                    </div>
                                                    <div class="msg"></div>                 
                                                    </div>
                                                 </td>
                                                </tr>
                                                <tr>
                                                <td><button class="btn btn-info btn-xs" ><i class="fa fa-envelope-o fa-fw"></i></button></td>
                                                <td><a href="mailto:ak@gmail.com"><?php echo $user['email']; ?></a></td>
                                                </tr>
                                                <tr>
                                                <td><button class="btn btn-info btn-xs"><i class="fa fa-calendar fa-fw"></i></button></td>
                                                <td>
                                                    <div class="form_group">
                                                            <input class="input100" id="zip" type="text" name="zip" value="<?php echo $user['zip_code'] ?>" autocomplete="off" onkeyup="validate(this)" required>
                                                    </div>
                                                    <div class="msg"></div>
                                                </td>
                                                </tr>                                                
                                                <tr>
                                                <td><button class="btn btn-info btn-xs"><i class="fa fa-phone fa-fw"></i></button></td>
                                                <td>
                                                    <div class="form_group">
                                                        <input class="input100" id="phone" type="text" name="phone" value="<?php echo $user['phone'] ?>" autocomplete="off" onkeyup="validate(this)" required>
                                                    </div>
                                                    <div class="msg"></div>
                                                </td>
                                                </tr>
                                                <input type="hidden" name="uid" value="<?php echo $uid ?>">

                                            </tbody>
                                        </table>
                                </div>

                            </div>
                            <div class="col-md-4">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-user"></i> Customer Details</h3>
                                    </div>
                                    <div class="form_group">
                                        <textarea class="input100" name="address" id="address" autocomplete="off"><?php echo $user['address'] ?></textarea>
                                    </div>
                                    <div class="msg"></div>
                                </div>                                                
                            </div>                    
                        </div>
                        <br>
                        <input type="submit" style="float: right;" class="btn btn-lg btn-success" name="submit" value="Confirm">
                        <div style="content: '';clear: both;display: block" class="clear-fix"></div>
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
    </script>




</body>
</html>
