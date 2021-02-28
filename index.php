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
<body>

    <?php 
    require 'views/navbar.php'; 
    require 'include/dbh.inc.php';
    ?>
    
    <div class="main-container">
 
    <?php require 'views/nav.php'; ?>

      <div id="maincontent" class="main-content">

        <div  class="banner">
          <img width="100%" src="images/Mac-Mini.jpg" alt="" class="banner">
          <h1>START YOUR TECH JOURNEY WITH MAC MINI</h1>
          <a href="viewproduct.php?productId=15" class="btn btn-primary bnr-btn">Buy It Now</a>
        </div>



        <div class="container-fluid">
            <div class="container">
              <div class="section">
                <h3 class="section-heading">SOME OF OUR FABOURITES</h3>
              </div>
                <div class="cards row">
                  <?php



                    $sqfp = "SELECT * FROM `featured-products`";
                    $rfp = $conn->query($sqfp);
                    if ($rfp->num_rows > 0) {
                      while ($p = $rfp->fetch_assoc()) {
                        $fpid = $p['featured_product_id'];
                        $sql = "SELECT * FROM `products` WHERE product_id = '$fpid'";
                        $rs = $conn->query($sql);
                        $data = $rs->fetch_assoc();
                            $pid = $data['product_id'];
                            $pname = $data['product_name'];
                            $price = $data['product_price'];
                            $img = $data['product_thumb'];
                            $stock = $data['product_stock'];
                            $catId = $data['product_catagory_id'];
                            $brandId = $data['product_brand_id'];

                            if (isset($_SESSION['u_id']) && isset($_SESSION['u_logedin']) ) {
                              $click = 'onclick="addToCart(this)"';
                            } else {
                              $click = 'onclick="login()"';
                            }

                            $sq = "SELECT product_catagory_name FROM pruduct_catagory WHERE product_catagory_id = '$catId';";
                            $result = $conn->query($sq);
                            if ($result->num_rows > 0) {
                                $row = $result->fetch_assoc();
                                $cat = $row['product_catagory_name'];
                            }

                            $sq = "SELECT brand_name FROM brands WHERE brand_id = '$brandId';";
                            $result = $conn->query($sq);
                            if ($result->num_rows > 0) {
                                $row = $result->fetch_assoc();
                                $brand = $row['brand_name'];
                            }

                            $html = '';
                            $html .= '<div class="card-container col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3"><div class="product-card">';
                            $html .= '<div class="img-cntnr">';
                            $html .= '<a href="viewproduct.php?productId='.$pid.'">';
                            $html .= '<img src="admin/'.$img.'" alt="" class="card-img">';
                            $html .= '</a>';
                            $html .= '</div>';
                            $html .= '<div class="card-details">';
                            $html .= '<a href="viewproduct.php?productId='.$pid.'"><span class="card-heading">'.$pname.'</span></a>';
                            $html .= '<p class="brand">Brand: '.$brand.'</p>';
                            $html .= '<p class="cat">Category: '.$cat.'</p>';
                            $html .= '<p class="stock">Abailable: '.$stock.'</p>';
                            $html .= '<h5 class="card-price">'.$price.' Tk.</h5>';
                            $html .= '<button id="'.$pid.'" class="btn btn-primary" '.$click.'>Add to Cart</button>';
                            $html .= '</div></div></div>';

                            echo $html;
                      }
                    }

                  ?>           
                </div>
            </div>
            <div class="container">
                <div class="section">
                  <div class="section-heading"></div>
                </div>
                <div  class="banner">
                    <img width="100%" src="images/5D-Mark-IV-Blog-Banner.jpg" alt="" class="banner">
                    <a style="left: 16%; top: 83%" href="viewproduct.php?productId=18" class="btn btn-primary bnr-btn">Buy It Now</a>
                  </div>
            </div>
            <div class="section">
                <h3 class="section-heading"></h3>
            </div>
            <div class="container">
                <div class="features">
                  <div class="row">
                    <div class="col-12 col-md-4 col-lg-4">
                      <div class="row feature">
                        <div class="col-2 col-md-3">
                          <img src="icons/cart.PNG" alt="">
                        </div>
                        <div class="col-10 col-md-9">
                        <h4>Free Shipping</h4>
                        <p>On Order Over 1000 tk.</p>                          
                        </div>
                      </div>
                    
                      

                    </div>
                    <div class="col-12 col-md-4 col-lg-4">
                      <div class="row feature">
                          <div class="col-2 col-md-3">
                              <img src="icons/shipping.PNG" alt="">
                            </div>
                            <div class="col-10 col-md-9">
                            <h4>Fast Delivery</h4>
                            <p>All Over Bangladesh</p>                          
                            </div>
                      </div>
                      
                    </div>  
                    <div class="col-12 col-md-4 col-lg-4">
                      <div class="row feature">
                          <div class="col-2 col-md-3">
                              <img src="icons/cart.PNG" alt="">
                            </div>
                            <div class="col-10 col-md-9">
                            <h4>Big Choice</h4>
                            <p>Of Products</p>                          
                            </div>
                      </div>
                      
                    </div>
                  </div>
                </div>
            </div>

            <div class="container">
              <div class="section">
                  <h3 class="section-heading">Follow Us On Social Media</h3>
              </div>                          
              <div class="bg-img">
                <div class="row follow-us">
                  <div class="col-4 col-md-4 col-lg-4">
                    <a href="#" class="fb"><i class="fa fa-facebook"></i></a>
                  </div>
                  <div class="col-4 col-md-4 col-lg-4">
                    <a href="#" class="ig"><i class="fa fa-instagram"></i></a>
                  </div>  
                  <div class="col-4 col-md-4 col-lg-4">
                    <a href="#" class="tw"><i class="fa fa-twitter"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="section">
                <h3 class="section-heading"></h3>
            </div>

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