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
                <div class="alert alert-success">
                    <h1 class="jumbootron">Thank You For Ordering.</h1>
                    <p>Your products will be shipped to your address soon. We will let you know the status of your order throgh your email.<br> For any kind of help please contact us with our contact section.</p>
                </div>
            </div>

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