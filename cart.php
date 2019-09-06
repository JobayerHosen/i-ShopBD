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

            <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-shopping-cart"></i>
                            Cart
                        </h3>
                    </div>
               
                    <div class="panel-body">
                        <table class="table table-bordered table-responsive table-hover">
                                        <thead>
                                        <tr>
                                            <td width="60px"><a href="#">Thumb</a></td>
                                            <td><a href="#">Product Name</a></td>
                                            <td><a href="#">Price </a></td>
                                            <td><a href="#">Category</a></td>
                                            <td><a href="#">Brand</a></td>
                                            <td><a href="#"><small>Stock</small></a></td>

                                            <td><a href="#">View</a></td>
                                            <td><a href="#"><small>Delete</small></a></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php
                                            require "include/paginator.php";                                        

                                            
                                            $uid = $_SESSION['u_id'];
                                            $sq = "SELECT * FROM `cart` WHERE cart_user_id = '$uid'";
                                            $rs = $conn->query($sq);
                                            if($rs->num_rows > 0) {
                                                while ($cart = $rs->fetch_assoc()) {
                                                    $pid = $cart['cart_product_id'];
                                                    $sql = "SELECT * FROM products WHERE product_id = '$pid'";
                                                    $rs2 = $conn->query($sql);
                                                    if ($rs2->num_rows > 0) {
                                                        while($data = $rs2->fetch_assoc()) {

                                                            echo "<tr>";
                                                            echo '<td><img src="admin/'.$data['product_thumb'].'" class="img-thumbnail"></td>';
                                                            echo "<td>".$data['product_name']."</td>";
                                                            echo "<td>".$data['product_price']."<small>Tk.</small></td>";
            
            
                                                            $catId = $data['product_catagory_id'];
                                                            $sq = "SELECT product_catagory_name FROM pruduct_catagory WHERE product_catagory_id = '$catId';";
                                                            $result = $conn->query($sq);
                                                            if ($result->num_rows > 0) {
                                                                $row = $result->fetch_assoc();
                                                                $cat = $row['product_catagory_name'];
            
                                                                echo "<td>".$cat."</td>";
                                                            }
            
                                                            $brandId = $data['product_brand_id'];
                                                            $sq = "SELECT brand_name FROM brands WHERE brand_id = '$brandId';";
                                                            $result = $conn->query($sq);
                                                            if ($result->num_rows > 0) {
                                                                $row = $result->fetch_assoc();
                                                                $brand = $row['brand_name'];
            
                                                                echo "<td>".$brand."</td>";
                                                            }
                                                            echo '<td>'.$data['product_stock'].'</td>';
                                                            echo '<td><a href="viewproduct.php?productId='.$data['product_id'].'" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a></td>';
                                                            echo '<td><a href="include/removecart.php?productId='.$data['product_id'].'&uId='.$uid.'" class="btn btn-danger btn-sm"><i class="fa fa-remove"></i></a></td>';
                                                            echo "</tr>";

                                                        }
                                                    }
                                                }
                                            }


                                        ?>

                                        </tbody>
                        </table>
                        <br>
                        <a style="float: right;" href="order.php" class="btn btn-lg btn-success">Check Out</a>
                        <div style="content: '';clear: both;display: block" class="clear-fix"></div>
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




</body>
</html>
