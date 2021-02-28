<?php 
    session_start();
    if (isset($_SESSION['u_id']) && isset($_SESSION['u_logedin']) ) {
        require 'dbh.inc.php';
        if (isset($_GET['id'])) {
            $pid = $_GET['id'];
            $uid = $_SESSION['u_id'];
            $sql = "SELECT * FROM cart WHERE cart_user_id = '$uid' AND cart_product_id = '$pid'";
            $rs = $conn->query($sql);
            if ($rs->num_rows < 1) {

                $sq = "INSERT INTO `cart`(`cart_user_id`, `cart_product_id`) VALUES('$uid', '$pid')";
                $rs = $conn->query($sq);
                if ($rs) {
                    echo 'Added to Cart';
                }
                else {
                    echo 'not added';
                }
            }
            else {
                echo 'Already Added';
            }
        }
        else {
            echo 'not available';
        }
    }
    else {
        echo 'Not Added';
        header('Location: ../login.php');
    }

?> 