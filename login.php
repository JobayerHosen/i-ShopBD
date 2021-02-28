<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>i Shop BD</title>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="css/placeholder-loading.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" type="text/css" rel="stylesheet">    
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <link href="css/signin.css" type="text/css" rel="stylesheet">

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

            <div class="container">

                <form class="form-signin" method="POST" action="include/loginexe.php" >
                <h2 class="form-signin-heading">Please Login</h2>
                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" name="pwd" id="inputPassword" class="form-control" placeholder="Password" required>
                <!-- <div class="checkbox">
                    <label>
                    <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div> -->
                <button class="btn btn-lg btn-primary btn-block" name="submit" type="submit">Sign in</button> <br>
                <a href="signup.php" class="btn btn-lg btn-success btn-block">Create Acount</a>
                </form>

            </div> <!-- /container -->

            <div class="section">
                <h3 class="section-heading"></h3>
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

</body>
</html>