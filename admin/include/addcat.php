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
        $cat = mysqli_real_escape_string($conn,$_POST['addcat']);
        if (!empty($cat)) {
            $sql = "SELECT * FROM pruduct_catagory WHERE product_catagory_name = '$cat';";
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                echo '<div class="alert alert-danger">The Category '.$cat.' Allready Exist.</div>';
            } else {
                $sql = "INSERT INTO pruduct_catagory (product_catagory_name) VALUES('$cat');";
                $conn->query($sql);
                echo '<div class="alert alert-success">The Category '.$cat.' Added Successfully.</div>';
            }
        } else {
            echo '<div class="alert alert-danger">Invail Category</div>';
        }
    }
?>

    </div>
</body>
</html>