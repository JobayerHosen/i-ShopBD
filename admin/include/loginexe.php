<?php
    session_start();
    require "dbh.inc.php";

    if (isset($_POST['submit'])) {
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $pwd = mysqli_real_escape_string($conn, $_POST['pwd']);

        $sql = "SELECT * FROM admins WHERE email='$email';";
        $result = $conn->query($sql);
        $resultcheck = $result->num_rows;
        
        if ($resultcheck < 1) {
            header('Location: ../login.php?login=notexist');
        } else {
            if ($row = $result->fetch_assoc()) {
                $hashMatch = password_verify($pwd, $row['pwd']);
                if ($hashMatch == true) {
                    $_SESSION['admin_id'] = $row['admin_id'];
                    $_SESSION['first'] = $row['first'];
                    $_SESSION['last'] = $row['last'];
                    $_SESSION['email'] = $row['email'];
                    $_SESSION['logedin'] = true; 
                    header('Location: ../index.php?login=success');
                } else {
                    header('Location: ../login.php?login=wrongpass');
                }
            }
        }
    } else {
        header('Location: ../login.php?login=login');
    }
?>

                