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

                                        <?php
                                            require "include/paginator.php";                                        

                                            
                                            $uid = $_SESSION['u_id'];
                                            $sq = "SELECT * FROM `cart` WHERE cart_user_id = '$uid'";
                                            $rs = $conn->query($sq);
                                            if($rs->num_rows > 0) {
                                                while ($cart = $rs->fetch_assoc()) {
                                                    $pid = $cart['cart_product_id'];
                                                    $sql = "SELECT * FROM products WHERE product_id = '$pid' AND product_stock = '0'";
                                                    $rs2 = $conn->query($sql);
                                                    if ($rs2->num_rows > 0) {
                                        ?>

            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-shopping-cart"></i>
                            Not Abailable | These Products Are not Abailable at this Moment.
                        </h3>
                    </div>
               
                    <div class="panel-body">
                        <table class="table table-bordered table-responsive table-hover" >
                                        <thead>
                                        <tr>
                                            <td width="60px"><a href="#">Thumb</a></td>
                                            <td><a href="#">Product Name</a></td>
                                            <td><a href="#">Stock </a></td>

                                            <td><a href="#">Price </a></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                                        <?php
                                                        while($data = $rs2->fetch_assoc()) {
                                                            echo '<tr style="background: #ff000033">';
                                                            echo '<td><img src="admin/'.$data['product_thumb'].'" class="img-thumbnail"></td>';
                                                            echo "<td>".$data['product_name']."</td>";
                                                            echo '<td>'.$data['product_stock'].'</td>';                
                                                            echo "<td>".$data['product_price']."<small>Tk.</small></td>";
                                                            echo "</tr>";
                                                        }
                                                        ?>
                                        </tbody>
                        </table>
                    </div>
                </div>    
            </div>
                                        <?php
                                                    }
                                                }
                                            }


                                        ?>



            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-shopping-cart"></i>
                            Order
                        </h3>
                    </div>
               
                    <div class="panel-body">
                        <form action="include/orderexe.php" method="POST">
                        <table class="table table-bordered table-responsive table-hover">
                                        <thead>
                                        <tr>
                                            <td width="60px"><a href="#"><small>Thumb</small></a></td>
                                            <td><a href="#">Product Name</a></td>
                                            <td><a href="#"><small>Stock</small> </a></td>
                                            <td><a href="#"><small>Quantity</small></a></td>
                                            <td><a href="#">Unit Price </a></td>
                                            <td><a href="#">Total</a></td>
                                            

        
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php

                                            
                                            $uid = $_SESSION['u_id'];
                                            $total = 0;
                                            $sq = "SELECT * FROM `cart` WHERE cart_user_id = '$uid'";
                                            $rs = $conn->query($sq);
                                            if($rs->num_rows > 0) {
                                                while ($cart = $rs->fetch_assoc()) {
                                                    $pid = $cart['cart_product_id'];
                                                    $qntt = $cart['cart_quantity'];
                                                    $sql = "SELECT * FROM products WHERE product_id = '$pid' AND NOT product_stock = '0'";
                                                    $rs2 = $conn->query($sql);
                                                    if ($rs2->num_rows > 0) {
                                                        while($data = $rs2->fetch_assoc()) {
                                                            $total += ($data['product_price'] * $qntt); 
                                                            echo "<tr>";
                                                            echo '<td><img src="admin/'.$data['product_thumb'].'" class="img-thumbnail"></td>';
                                                            echo "<td>".$data['product_name']."</td>";
                                                            echo '<td>'.$data['product_stock'].'</td>';           
                                                            echo '<td><input onchange="cart('.$uid.', '.$pid.', this.value)" type="number" style="width: 60px;" value="'.$qntt.'" min="1" max="'.$data['product_stock'].'"></td>';     
                                                            echo "<td>".$data['product_price']."<small>Tk.</small></td>";
                                                            echo "<td>".($data['product_price'] * $qntt)."<small>Tk.</small></td>";
                                                            echo "</tr>";

                                                        }

                                                    }
                                                }
                                                        echo '<tr>';                                                        
                                                        echo '<td class="text-right" colspan="5">Sub Total</td>';
                                                        echo '<td>'.$total.'<small>Tk.</small></td>';
                                                        echo '</tr>';
                                                        echo '<tr><td class="text-right" colspan="5">Shipping</td><td>100<small>Tk</small></td></tr>';                                           }
                                                        echo '<tr>';                                                        
                                                        echo '<td class="text-right" colspan="5">Total</td>';
                                                        echo '<td>'.($total + 100).'<small>Tk.</small></td>';
                                                        echo '</tr>';
                                        ?>

                                        </tbody>
                        </table>
                        <br>
                        <input type="submit" name="order" value="Submit Order" style="float: right;" class="btn btn-lg btn-success">
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
        function cart(uid, pid, qntt) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {

            if (this.readyState == 4 && this.status == 200) {
                document.location.reload(true);
            }
        }
        xhttp.open("GET",'include/cartchange.php?pid='+pid+'&uid='+uid+'&qntt='+qntt,true);
        xhttp.send();
    }

    </script>




</body>
</html>
