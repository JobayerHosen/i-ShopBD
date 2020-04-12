<?php 
    session_start();
    if (isset($_POST['order'])) {
        if (isset($_SESSION['u_id'])) {
            $uid = $_SESSION['u_id'];
            require 'dbh.inc.php';
            $total = 0;
             //SELECTING THE USER'S CART.
            $sqc = "SELECT * FROM `cart` WHERE cart_user_id = '$uid'";
            $rs = $conn->query($sqc);
            if ($rs->num_rows > 0) {
                $sqo = "INSERT INTO orders(`order_user_id`) VALUES('$uid')"; //INSERTING A ORDER
                $rso = $conn->query($sqo);
                $sqo = "SELECT LAST_INSERT_ID()"; //TAKING THAT ORDER ID
                $rso = $conn->query($sqo);
                $oid = $rso->fetch_assoc();
                $oid = $oid['LAST_INSERT_ID()'];
                while ($cart = $rs->fetch_assoc()) {
                    //NOW FOR EVERY PRODUCT IN THE CART , INSERTING THE PRODUCT INTO 'order_item' TABLE ALONG WITH THE order_id.
                    $pid = $cart['cart_product_id'];
                    $qntt = $cart['cart_quantity'];
                    $sqp = "SELECT * FROM `products` WHERE product_id = '$pid' AND NOT product_stock = '0'";
                    $rsp = $conn->query($sqp);
                    if ($rsp->num_rows > 0) {
                        $pdct = $rsp->fetch_assoc();
                        $sqi = "INSERT INTO `order_items`(`orders_order_id`, `products_product_id`,`product_quantity`) VALUES('$oid','$pid','$qntt')";
                        $rsi = $conn->query($sqi);
                        $price = ($qntt * $pdct['product_price']); //COUNTING THE TOTAL AMOUNT TO BE PAID.
                        $total += $price;
                    }
                }
                $total += 100;
                $sqpm = "INSERT INTO `payments`(`payment_order_id`,`payment_amount`) VALUES('$oid','$total')";
                $rspm = $conn->query($sqpm);
                header('Location: ../thanks.php');
            }
        }
    }
?>