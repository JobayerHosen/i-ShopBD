<?php

 if (isset($_POST["submit"])) {
    include_once "dbh.inc.php"; //Database Connection
    $u_id = mysqli_real_escape_string($conn,$_POST['uid']);
    $first =mysqli_real_escape_string($conn,$_POST['first']);
    trim($first);
    $last =mysqli_real_escape_string($conn,$_POST['last']);
    trim($last);
    $address =mysqli_real_escape_string($conn,$_POST['address']);
    $zip =mysqli_real_escape_string($conn,$_POST['zip']);
    $phone =mysqli_real_escape_string($conn,$_POST['phone']);


    //Checking if any fild is Empty
    $header = "Location: ../reviewinfo.php?uid=".$u_id;
    if (empty($first) || empty($last) || empty($address) || empty($phone) || empty($zip)) {
        $header .= "&review=empty";
        header($header);
        exit();
        
    }
   //Checking if the name is Valid
    if (!preg_match("/^[a-zA-Z ]*$/", $first) || !preg_match("/^[a-zA-Z ]*$/", $last)) {
        $header .= "&review=invalidname";
        header($header);
        exit();
    }

    if (strlen($address) < 10) {
        $header .= "&review=invalidaddress";
        header($header);
        exit();
    }

    if ((strlen($zip) < 4) || (!preg_match("/^[0-9]*$/", $zip))) {
        $header .= "&review=invalidzip";
        header($header);
    }

    if ((strlen($phone) < 11) || (!preg_match("/^[0-9]*$/", $phone))) {
        $header .= "&review=invalidphone";
        header($header);
    }

            $sql = "UPDATE `users` SET `first_name` = '$first', `last_name` = '$last', `zip_code` = '$zip', `address` = '$address', `phone` = '$phone' WHERE `users`.`user_id` = $u_id";
            mysqli_query($conn, $sql);
            header("Location: ../order.php?review=success");
            exit();
                        


 } else {
        header("Location: ../signup.php?signup=error");
        exit();
    }










 

 

?>

