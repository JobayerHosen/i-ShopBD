<?php 
session_start();
if (!isset($_SESSION['admin_id']) || $_SESSION['logedin'] != true) {
  header('Location: login.php?login=logingfirst');
}

require "include/dbh.inc.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>i Shop BD | Admin</title>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <link href="css/font-awesome.min.css" type="text/css" rel="stylesheet">

</head>
<body>

    <div id="container">
        <header id="header">
            <div class="navbar">
                <div id="header-logo" class="navbar-header">
                    <a href="../index.php"><img src="../icons/ishopbd.png" alt=""></a>
                </div>
                <div class="navbar-right">
                <a href="include/logout.php" class="btn btn-danger" ><i class="fa fa-sign-out"></i> <span class="hidden-xs hidden-sm hidden-md">Logout</span></a>
                </div>
            </div>
        </header>

        <?php require_once "views/nav.php";?>

        <div id="content">
            <?php 
            
                if (isset($_GET['route'])) {
                    $route = $_GET['route'];
                    include 'views/'.$route.'.php';
                }   else {
                    $route = '';
                    header("Location: index.php?route=dashboard") ;
                }
            
            ?>
        </div>
    </div>
    <script src="jquery-2.2.3.min.js"></script>
    <script src="bootstrap.js"></script>
    <script src="ckeditor/ckeditor.js"></script>
    <script>
        CKEDITOR.replace("desc");
    </script>
    <script> 
        <?php
        if (isset($_GET['parent'])) { ?>
            document.getElementById("<?php echo $_GET['parent'];?>").className = "collapse in";
        <?php } ?>
        
        document.getElementById("<?php echo $route; ?>").className = "active" ;
        
    </script>
</body>
</html>