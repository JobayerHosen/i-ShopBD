<?php
    if (isset($_GET['uid']) && isset($_GET['pid']) && isset($_GET['qntt'])) {
        $uid = $_GET['uid'];
        $pid = $_GET['pid'];
        $qntt = $_GET['qntt'];
        require 'dbh.inc.php';
        $sq = "UPDATE `cart` SET `cart_quantity` = '$qntt' WHERE `cart`.`cart_user_id` = '$uid' AND cart_product_id = '$pid'";
        $rs = $conn->query($sq);

    } 
?>