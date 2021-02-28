<!-- Database connection -->
<?php
    $dbServerName = 'localhost';
    $dbUserName = 'root';
    $dbPassword = "";
    $dbName = "simple-ecom";

    $conn = new mysqli($dbServerName, $dbUserName,$dbPassword,$dbName);

?>