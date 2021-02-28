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


        <?php
        $catId = '';
        $brandId = '';
        $search = '';
        
        if  (isset($_GET['catId'])) {
            $catId = $_GET['catId'];

        }
        if (isset($_GET['brandId'])) {
        $brandId = $_GET['brandId'];
        }
        if(isset($_GET['search'])) {
          $search = $_GET['search'];
        }
        echo '<input id="hiddenCat" value="'.$catId.'" type="hidden">';
        echo '<input id="hiddenBrand" value="'.$brandId.'" type="hidden">';
        echo '<input id="hiddenSearch" value="'.$search.'" type="hidden">';
        ?>

        <div class="container-fluid">
          <div class="container">
            <div class="section">
              <h3 class="section-heading">Showing Result</h3>
            </div>
            <div id="cards">
            
            </div>


          </div>

            <div id="ph" class="container ph">
                  <br>
                      <div  class="ph-item">

                              <div class="ph-col-2">
                                <div class="ph-avatar"></div>
                              </div>
                        
                              <div>
                                <div class="ph-row">
                                  <div class="ph-col-4"></div>
                                  <div class="ph-col-8 empty"></div>
                                  <div class="ph-col-6"></div>
                                  <div class="ph-col-6 empty"></div>
                                  <div class="ph-col-2"></div>
                                  <div class="ph-col-10 empty"></div>
                                </div>
                              </div>
                        
                              <div class="ph-col-12">
                                <div class="ph-picture"></div>
                                <div class="ph-row">
                                  <div class="ph-col-10 big"></div>
                                  <div class="ph-col-2 empty big"></div>
                                  <div class="ph-col-4"></div>
                                  <div class="ph-col-8 empty"></div>
                                  <div class="ph-col-6"></div>
                                  <div class="ph-col-6 empty"></div>
                                  <div class="ph-col-12"></div>
                                </div>
                              </div>
                        
                            </div>

              </div>
              <div class="section">
                  <h2 class="section-heading"></h2>
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
            <div class="section">
                <h3 class="section-heading">Follow Us On Social Media</h3>
            </div>              
          <div class="container">
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
        window.onload = function() {
        var cat = document.getElementById('hiddenCat').value;
        var brand = document.getElementById('hiddenBrand').value;
        var search = document.getElementById('hiddenSearch').value;
        load(cat, brand, search)
        }
    </script>
</body>
</html>