<?php
 require 'dbh.inc.php';
 if(isset($_GET['uId']) && isset($_GET['productId']) ) {
     $uid = $_GET['uId'];
     $pid = $_GET['productId'];

    $sql = "DELETE FROM `cart` WHERE cart.cart_user_id = '$uid' AND cart.cart_product_id = '$pid'";
    $conn->query($sql);
    header("Location: ../cart.php");
 }

?>