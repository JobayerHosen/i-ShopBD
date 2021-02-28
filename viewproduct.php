<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>i Shop BD</title>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="css/placeholder-loading.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" type="text/css" rel="stylesheet">    
    <link href="css/style.css" type="text/css" rel="stylesheet">

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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">View Product</h3>
                </div>
                <div class="panel-body">

                    <?php 
                    include 'include/dbh.inc.php';
                    $pid = isset($_GET['productId']) == true?$_GET['productId']:0;
                    $sql = "SELECT * FROM products WHERE product_id='$pid'";
                    $result = $conn->query($sql);
                    if (!$result->num_rows > 0) {
                        echo '<h2>No Product Found</h2>';
                    } 
                    
                    else { // if product found...
                      $row = $result->fetch_assoc(); 
                    ?> 

                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <?php
                            echo '<img width="100%" src="admin/'.$row['product_thumb'].'" class="">';
                            ?>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 mt-md-4">
                            <?php
                                echo '<h2 class="product-ttl" >'.$row['product_name'].'</h2>';
                                echo '<br>';
                                $brandId = $row['product_brand_id'];
                                $sq = "SELECT brand_name FROM brands WHERE brand_id = '$brandId';";
                                $result = $conn->query($sq);
                                if ($result->num_rows > 0) {
                                    $r = $result->fetch_assoc();
                                    $brand = $r['brand_name'];

                                }
                                echo '<p class="brand">Brand: '.$brand.'</p>';
                                
                                $catId = $row['product_catagory_id'];
                                $sq = "SELECT product_catagory_name FROM pruduct_catagory WHERE product_catagory_id = '$catId';";
                                $result = $conn->query($sq);
                                if ($result->num_rows > 0) {
                                    $r = $result->fetch_assoc();
                                    $cat = $r['product_catagory_name'];
                                }
                                echo '<p class="cat">Category: '.$cat.'</p>';
                                echo '<p class="stock">Available: '.$row['product_stock'].'</p>';
                                echo '<h3>Price: <span class="price">'.$row['product_price'].' Tk.</span></h3>';
                                echo '<br>';

                                if (isset($_SESSION['u_id']) && isset($_SESSION['u_logedin']) ) {
                                    $click = 'onclick="addToCart(this)"';
                                } else {
                                  $click = 'onclick="login()"';
                                }


                                echo '<button id="'.$pid.'" '.$click.' class="btn btn-primary">Add to Cart</button>';
                            ?>
                            
                        </div>
                    </div>
                    <br>
                    <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="description fluid-container">
                                <?php 
                                    echo $row['product_description'];
                                ?>
                                </div>

                            </div>
                    </div>
                    <br>
                    <div class="row">
                                <?php
                                    $sq = "SELECT * FROM product_images WHERE img_product_id = '$pid';";
                                    $result = $conn->query($sq);
                                    if ($result->num_rows > 0) {
                                        while ($imgs = $result->fetch_assoc()) {

                                ?>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <img width="100%" src="admin/<?php echo $imgs['img_url'] ?>" alt="">
                                    </div> <?php
                                        }
                                    }?>
                    </div>


                    <?php } //else block for product found end here ?>



                </div>
            </div>

        </div>

      </div>
      <footer class="footer">
          <div class="full-width-footer">
              <div class="container py-md-5 py-sm-4 py-3">
                <div class="row footer-info w3-agileits-info">
                  <!-- footer categories -->
                  <div class="col-md-3 col-sm-6 footer-grids">
                    <h3 class="text-white font-weight-bold mb-3">Categories</h3>
                    <ul>
                      <li class="mb-3">
                        <a href="product.html">Mobiles </a>
                      </li>
                      <li class="mb-3">
                        <a href="product.html">Computers</a>
                      </li>
                      <li class="mb-3">
                        <a href="product.html">TV, Audio</a>
                      </li>
                      <li class="mb-3">
                        <a href="product2.html">Smartphones</a>
                      </li>
                      <li class="mb-3">
                        <a href="product.html">Washing Machines</a>
                      </li>
                      <li>
                        <a href="product2.html">Refrigerators</a>
                      </li>
                    </ul>
                  </div>
                  <!-- //footer categories -->
                  <!-- quick links -->
                  <div class="col-md-3 col-sm-6 footer-grids mt-sm-0 mt-4">
                    <h3 class="text-white font-weight-bold mb-3">Quick Links</h3>
                    <ul>
                      <li class="mb-3">
                        <a href="about.html">About Us</a>
                      </li>
                      <li class="mb-3">
                        <a href="contact.html">Contact Us</a>
                      </li>
                      <li class="mb-3">
                        <a href="help.html">Help</a>
                      </li>
                      <li class="mb-3">
                        <a href="faqs.html">Faqs</a>
                      </li>
                      <li class="mb-3">
                        <a href="terms.html">Terms of use</a>
                      </li>
                      <li>
                        <a href="privacy.html">Privacy Policy</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-md-3 col-sm-6 footer-grids mt-md-0 mt-4">
                    <h3 class="text-white font-weight-bold mb-3">Get in Touch</h3>
                    <ul>
                      <li class="mb-3">
                        <i class="fa fa-map-marker"></i> 123 Sebastian, USA.</li>
                      <li class="mb-3">
                        <i class="fa fa-mobile"></i> 333 222 3333 </li>
                      <li class="mb-3">
                        <i class="fa fa-phone"></i> +222 11 4444 </li>
                      <li class="mb-3">
                        <i class="fa fa-envelope-open"></i>
                        <a href="mailto:example@mail.com"> mail@example.com</a>
                      </li>
                      <li>
                        <i class="fa fa-envelope-open"></i>
                        <a href="mailto:example@mail.com"> hello@example.com</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-md-3 col-sm-6 footer-grids w3l-agileits mt-md-0 mt-4">
                    <!-- newsletter -->
                    <h3 class="text-white font-weight-bold mb-3">Newsletter</h3>
                    <p class="mb-3">Free Delivery on your first order!</p>
                    <form action="#" method="post">
                      <div class="form-group">
                        <input type="email" class="form-control" placeholder="Email" name="email" required="">
                        <input type="submit" value="Go">
                      </div>
                    </form>
                    <!-- //newsletter -->
                    <!-- social icons -->
                    <div class="footer-grids  w3l-socialmk mt-3">
                      <h3 class="text-white font-weight-bold mb-3">Follow Us on</h3>
                      <div class="social">
                        <ul>
                          <li>
                            <a class="icon fb" href="#">
                              <i class="fa fa-facebook"></i>
                            </a>
                          </li>
                          <li>
                            <a class="icon tw" href="#">
                              <i class="fa fa-twitter"></i>
                            </a>
                          </li>
                          <li>
                            <a class="icon ig" href="#">
                              <i class="fa fa-instagram"></i>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </div>
                    <!-- //social icons -->
                  </div>
                </div>
                <!-- //quick links -->
              </div>
            </div>
        
      </footer>
    </div>





    <script src="js/jquery-3.2.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>