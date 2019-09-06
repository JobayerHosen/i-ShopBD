<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ElectroBazar|Admin</title>
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
        $brand = mysqli_real_escape_string($conn,$_POST['addbrand']);
        if (!empty($brand)) {
            $sql = "SELECT * FROM brands WHERE brand_name = '$brand';";
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                echo '<div class="alert alert-danger">The Brand '.$brand.' Allready Exist.</div>';
            } else {
                $sql = "INSERT INTO brands (brand_name) VALUES('$brand');";
                $conn->query($sql);
                echo '<div class="alert alert-success">The Brand '.$brand.' Added Successfully.</div>';
            }
        } else {
            echo '<div class="alert alert-danger">Invail Brand</div>';
        }
    }
?>

    </div>
</body>
</html>