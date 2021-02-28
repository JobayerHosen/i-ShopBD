<?php
    session_start();
    require "dbh.inc.php";

    if (isset($_POST['submit'])) {
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $pwd = mysqli_real_escape_string($conn, $_POST['pwd']);

        $sql = "SELECT * FROM users WHERE email='$email';";
        $result = $conn->query($sql);
        
        if ($result->num_rows < 1) {
            header('Location: ../login.php?login=notexist');
        } else {
            while ($row = $result->fetch_assoc()) {
                $hashMatch = password_verify($pwd, $row['pwd']);
                if ($hashMatch == true) {
                    $_SESSION['u_id'] = $row['user_id'];
                    $_SESSION['u_first'] = $row['first_name'];
                    $_SESSION['u_last'] = $row['last_name'];
                    $_SESSION['u_email'] = $row['email'];
                    $_SESSION['u_active'] = $row['active'];
                    $_SESSION['u_logedin'] = true; 
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

                