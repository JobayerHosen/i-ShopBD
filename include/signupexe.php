<?php

 if (isset($_POST["submit"])) {
    include_once "dbh.inc.php"; //Database Connection
    // $u_id = mysqli_real_escape_string($conn,$_POST['uname']);
    $first =mysqli_real_escape_string($conn,$_POST['first']);
    $last =mysqli_real_escape_string($conn,$_POST['last']);
    $email =mysqli_real_escape_string($conn,$_POST['email']);
    $address =mysqli_real_escape_string($conn,$_POST['address']);
    $zip =mysqli_real_escape_string($conn,$_POST['zip']);
    $phone =mysqli_real_escape_string($conn,$_POST['phone']);
    $pwd =mysqli_real_escape_string($conn,$_POST['pwd']);


    //Checking if any fild is Empty
    if (empty($first) || empty($last) || empty($email) || empty($pwd)) {
        header("Location: ../signup.php?signup=empty");
        exit();
        
    } else {
        //Checking if the name is Valid
        if (!preg_match("/^[a-zA-Z]*$/", $first) || !preg_match("/^[a-zA-Z]*$/", $last)) {
            header("Location: ../signup.php?signup=invalidname");
            exit();
        } else {
            //Validate Email
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                header("Location: ../signup.php?signup=invalidemail");
                exit();
            } else {
                //Checking if the Email Already Exist
                $sqlemail = "SELECT * FROM users WHERE email = '$email';";
                $resultemail = mysqli_query($conn, $sqlemail);
                $resultcheck = mysqli_num_rows($resultemail);
                if ($resultcheck > 0) {
                    header("Location: ../signup.php?signup=emailexist");
                    exit();
                } else {
                            //Sign UP the User
                            $hashed_pwd = password_hash($pwd, PASSWORD_DEFAULT);
                            $sql = "INSERT INTO `users` (`first_name`, `last_name`, `email`, `zip_code`, `address`, `phone`, `pwd`) VALUES ('$first', '$last', '$email', '$zip', '$address', '$phone', '$hashed_pwd');";
                            mysqli_query($conn, $sql);
                            header("Location: ../index.php?signup=success");
                            exit();
                        
                }
            }
        }
    }


 } else {
        header("Location: ../signup.php?signup=error");
        exit();
    }










 

 

?>

