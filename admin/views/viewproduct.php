<div class="container-fluid">
<div class="page-header">
            <div class="pull-right">
                <button type="button" id="button-setting" title="" data-loading-text="Loading..." class="btn btn-info"><i class="fa fa-cog"></i></button>
            </div>
        <h1>View Product</h1>
</div>
</div>

<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">View Product</h3>
        </div>
        <div class="panel-body">

            <?php 
                $pid = isset($_GET['productId']) == true?$_GET['productId']:0;
                $sql = "SELECT * FROM products WHERE product_id='$pid'";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                }
                // print_r($row);
            ?>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <?php
                    echo '<img width="100%" src="'.$row['product_thumb'].'" class="">';
                    ?>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
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
                        echo '<h4>Brand: '.$brand.'</h4>';
                        
                        $catId = $row['product_catagory_id'];
                        $sq = "SELECT product_catagory_name FROM pruduct_catagory WHERE product_catagory_id = '$catId';";
                        $result = $conn->query($sq);
                        if ($result->num_rows > 0) {
                            $r = $result->fetch_assoc();
                            $cat = $r['product_catagory_name'];
                        }
                        echo '<h4>Category: '.$cat.'</h4>';
                        echo '<h4>Available: '.$row['product_stock'].'</h4>';
                        echo '<br>';
                        echo '<h2>Price: <span class="price">'.$row['product_price'].'Tk.</span></h2>';
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
                                <img width="100%" src="<?php echo $imgs['img_url'] ?>" alt="">
                            </div> <?php
                                }
                            }?>

            </div>



        </div>
    </div>

</div>