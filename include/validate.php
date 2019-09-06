<?php
    include 'dbh.inc.php';
    if (isset($_GET['input']) && isset($_GET['value'])) {

        // Validate Name---
        if (($_GET['input'] == 'first') || ($_GET['input'] == 'last')) {
            $name = htmlspecialchars($_GET['value']);
            if (strlen($name) < 1) {
                echo '<div class="alert alert-danger" role="alert">Minimum 1 Character</div>';
                exit();
            } else {
                if (!preg_match("/^[a-zA-Z]*$/", $name)) {
                    echo '<div class="alert alert-danger" role="alert">Invalid Name</div>';
                    exit();
                } else {
                    echo '';
                    
                }
            }
        }


        // Validate Email---
        if ($_GET['input'] == 'email') {
            $email = htmlspecialchars($_GET['value']);

            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                echo '<div class="alert alert-danger" role="alert">Enter a Valid Email.</div>';
                exit();
            } 
            else {
                 //Checking if the Email Already Exist
                 $sqlemail = "SELECT * FROM users WHERE email = '$email';";
                 $resultemail = mysqli_query($conn, $sqlemail);
                 $resultcheck = mysqli_num_rows($resultemail);
                 if ($resultcheck > 0) {
                    echo '<div class="alert alert-danger" role="alert">Email Already Exist.</div>';
                     exit();
                 } 
                 else {
                     echo '';
                 }
            }
        }

        // Validate Address--- 
        if ($_GET['input'] == 'address') {
            $address = htmlspecialchars($_GET['value']);
            if (strlen($address) < 10) {
                echo '<div class="alert alert-danger" role="alert">Enter Valid Address.</div>';
                exit();
            }
            else {
                echo '';
            }
        }

        //Validate Zip--- 
        if ($_GET['input'] == 'zip') {
            $zip = htmlspecialchars($_GET['value']);
            if ((strlen($zip) < 4) || (!preg_match("/^[0-9]*$/", $zip))) {

                echo '<div class="alert alert-danger" role="alert">Enter Valid Zip Code.</div>';
            }
            else {
                echo '';
            }
        }

        // Validate Phone---
        if ($_GET['input'] == 'phone') {
            $phone = htmlspecialchars($_GET['value']);
            if ((strlen($phone) < 11) || (!preg_match("/^[0-9]*$/", $phone))) {

                echo '<div class="alert alert-danger" role="alert">Enter Valid Phone Number.</div>';
            }
            else {
                echo '';
            }
        }

        // Validate Password---
        if ($_GET['input'] == 'pwd') {
            $pwd = htmlspecialchars($_GET['value']);
            if (strlen($pwd) < 6) {

                echo '<div class="alert alert-danger" role="alert">Password Must Have atleast 6 Digit.</div>';
            }
            else {
                echo '';
            }
        }

    }
?>