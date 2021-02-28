<?php
    session_start();
    include_once 'dbh.inc.php';
    $limit = isset($_GET['limit'])?$_GET['limit']:100;
    $page = isset($_GET['page'])?$_GET['page']:1;
    $catId = '';
    $brandId = '';
    $search = '';
    $html = '';
    $sql = "SELECT * FROM `products`";
        
    if  (isset($_GET['catId'])) {
        $catId = $_GET['catId'];
        $sql .= $catId != ''? " WHERE product_catagory_id = '$catId'": '';
        if (isset($_GET['brandId'])) {
            $brandId = $_GET['brandId'];

            $sql .= $brandId != ''? " AND product_brand_id = '$brandId'": '';
            
        }
    }
    // echo $sql;
        if (isset($_GET['search'])) {
          if( $_GET['search'] != '') {
            $search = $_GET['search'];
            $search = explode(' ', $search); 
            $sql .= $catId != ''?" AND":" WHERE";
            for ($i = 0; $i < sizeof($search); $i++) {
              $sql .= $i != 0?' AND ':" ";
              $Kw = $search[$i] ;
              $sql .= "product_name LIKE '%$Kw%'";
            }
          }           
        }
    ?>

    <?php
    require 'paginator.php';
    $datas = getData($limit, $page, $sql);
    if ($datas) {
        $html .= '<div class="cards row">';
        foreach ($datas as $data) {
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

            $html .= '<div class="card-container col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3">';
            $html .= '<div class="product-card">';
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


        }
                
    } else {
        $html = '<h2>NO PRODUCT FOUNd</h2>';
    }
    echo $html;

    ?>
<!-- <div class="cards row">
              <div class="card-container col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3">
                <div class="product-card">
                  <div class="img-cntnr">
                    <a href="#">
                    <img src="images/microsoft-surface.jpg" alt="" class="card-img">
                    </a>
                  </div>
                  <div class="card-details">
                    <a href="">
                    <span class="card-heading">Apple MacBook Pro 13-inch Retina Display with Touch Bar, Core i5, 8GB RAM, 256GB SSD</span></a>
                    <p class="brand">Brand: Apple</p>
                    <p class="cat">Category: Laptop</p>
                    <p class="stock">Abailable: 10</p>
                    <h5 class="card-price">150000 Tk.</h5>
                    <button class="btn btn-primary">Add to Cart</button>

                  </div>          
                </div>

              </div>
              <div class="card-container col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3">
                  <div class="product-card">
                    <div class="img-cntnr">
                      <a href="#">
                      <img src="images/microsoft-surface.jpg" alt="" class="card-img">
                      </a>
                    </div>
                    <div class="card-details">
                      <h5 class="card-heading">Apple MacBook Pro 13-inch with Touch Bar, Core i5, 8GB RAM, 256GB SSD</h5>
                      <p class="brand">Brand: Apple</p>
                      <p class="cat">Category: Laptop</p>
                      <p class="stock">Abailable: 10</p>
                      <h5 class="card-price">150000 Tk.</h5>
  
                    </div>                
                  </div>
  
              </div>

                <div class="card-container col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3">
                    <div class="product-card">
                      <div class="img-cntnr">
                        <a href="#">
                        <img src="images/MM1_01.gif" alt="" class="card-img">
                        </a>
                      </div>
                      <div class="card-details">
                        <h5 class="card-heading">Apple MacBook Pro 13-inch Retina Display with Touch Bar, Core i5, 8GB RAM, 256GB SSD</h5>
                        <p class="brand">Brand: Apple</p>
                        <p class="cat">Category: Laptop</p>
                        <p class="stock">Abailable: 10</p>
                        <h5 class="card-price">150000 Tk.</h5>
    
                      </div>                
                    </div>
    
                </div>

                <div class="card-container col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3">
                    <div class="product-card">
                      <div class="img-cntnr">
                        <a href="#">
                        <img src="images/galax-1650-corpy.jpg" alt="" class="card-img">
                        </a>
                      </div>
                      <div class="card-details">
                        <h5 class="card-heading">Apple MacBook Pro 13-inch </h5>
                        <p class="brand">Brand: Apple</p>
                        <p class="cat">Category: Laptop</p>
                        <p class="stock">Abailable: 10</p>
                        <h5 class="card-price">150000 Tk..</h5>
    
                      </div>                
                    </div>
    
                </div>

                <div class="card-container col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3">
                    <div class="product-card">
                      <div class="img-cntnr">
                        <a href="#">
                        <img src="images/microsoft-surface.jpg" alt="" class="card-img">
                        </a>
                      </div>
                      <div class="card-details">
                        <h5 class="card-heading">Apple MacBook Pro 13-inch with Touch Bar, Core i5, 8GB RAM, 256GB SSD</h5>
                        <p class="brand">Brand: Apple</p>
                        <p class="cat">Category: Laptop</p>
                        <p class="stock">Abailable: 10</p>
                        <h5 class="card-price">150000 Tk.</h5>
    
                      </div>                
                    </div>
    
                </div>
  
                  <div class="card-container col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3">
                      <div class="product-card">
                        <div class="img-cntnr">
                          <a href="#">
                          <img src="images/MM1_01.gif" alt="" class="card-img">
                          </a>
                        </div>
                        <div class="card-details">
                          <h5 class="card-heading">Apple MacBook Pro 13-inch Retina Display with Touch Bar, Core i5, 8GB RAM, 256GB SSD</h5>
                          <p class="brand">Brand: Apple</p>
                          <p class="cat">Category: Laptop</p>
                          <p class="stock">Abailable: 10</p>
                          <h5 class="card-price">150000 Tk.</h5>
      
                        </div>                
                      </div>
      
                  </div>
            </div> -->