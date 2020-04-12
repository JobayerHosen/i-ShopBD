<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>i-ShopBD |Admin</title>
    <link href="../css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" type="text/css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
    </style>

</head>

<body>
    <div class="container">

<?php
    if (isset($_POST["submit"])) {
        include_once "dbh.inc.php"; //Database Connection
        $pName = mysqli_real_escape_string($conn,$_POST['product_name']);
        // $pModel = mysqli_real_escape_string($conn,$_POST['model']);
        $pBrand = mysqli_real_escape_string($conn,$_POST['brand']);
        $pCategory = mysqli_real_escape_string($conn,$_POST['category']);
        $pPrice = mysqli_real_escape_string($conn,$_POST['price']);
        $pDesc = mysqli_real_escape_string($conn,$_POST['desc']);
        $pStock = mysqli_real_escape_string($conn,$_POST['stock']);
        $pThumb = $_FILES['thumb'];
        $pImage = $_FILES['images'];

        if (empty($pName) || empty($pBrand) || empty($pCategory) || empty($pPrice) || empty($pDesc) || empty($pStock) || empty($pThumb)) {
            echo '<div class="alert alert-danger">Please Fill All The Fields</div>';
        } else {
            require 'imageUp.php';
            
            $th = picUpload($pThumb, 'pics');
            // echo '<pre>';
            // print_r ($th);
            // echo '</pre>';        
            

            if ($th['err']) {
                echo $th['err'];
                echo '<div class="alert alert-danger">'.$th['err'].'</div>';
            } else {
                require 'multiImageUp.php';
                $img = multipicupload($pImage, 'pics');
                // echo '<pre>';
                // print_r ($img);
                // echo '</pre>';
                $thumb = $th['name'];

                if ($img['error']) {
                    for ($i=0; $i < count($img['errorList']); $i++) {
                        echo '<div class="alert alert-danger">'.$img['errorList'][$i].'</div>';
                    }

                } else {
                    $sql = "SELECT brand_id FROM brands WHERE brand_name = '$pBrand';";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        $row = $result->fetch_assoc();
                        $brandId = $row['brand_id'];
                    }

                    $sql = "SELECT product_catagory_id FROM pruduct_catagory WHERE product_catagory_name = '$pCategory';";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        $row = $result->fetch_assoc();
                        $catId = $row['product_catagory_id'];
                    }

                    $sql = "INSERT INTO `products`(`product_name`, `product_price`, `product_thumb`, `product_description`, `product_stock`, `product_brand_id`, `product_catagory_id`)  VALUES ('$pName', '$pPrice', '$thumb', '$pDesc', '$pStock', '$brandId' , '$catId');";

                    $conn->query($sql);

                    $sql = "SELECT product_id FROM `products` WHERE product_name = '$pName' AND product_brand_id = '$brandId' AND product_catagory_id = '$catId';";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        $row = $result->fetch_assoc();
                        $pId = $row['product_id'];
                    }

                    foreach ($img['links'] as $r) {
                        // echo ('<img src="'.$r.'">');
                        $sql = "INSERT INTO `product_images`(`img_product_id`, `img_url`) VALUES ($pId, '$r');";
                        $conn->query($sql);
                    }
                    echo '<div class="alert alert-success">Product Uploaded Successfully.</div>';

                }
            }

        }

    } else {
        header('Location: ../index.php?route=addproducts&parent=collapse1');
    }

?>
    </div>

</body>
</html>