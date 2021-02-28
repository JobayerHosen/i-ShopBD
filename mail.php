<?php

/* Namespace alias. */
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

/* Include the Composer generated autoload.php file. */
// require 'C:\xampp\composer\vendor\autoload.php';

/* If you installed PHPMailer without Composer do this instead: */

require 'C:\PHPMailer\src\Exception.php';
require 'C:\PHPMailer\src\PHPMailer.php';
require 'C:\PHPMailer\src\SMTP.php';


/* Create a new PHPMailer object. Passing TRUE to the constructor enables exceptions. */
// $mail = new PHPMailer(TRUE);


   
    $mail->setFrom('juba2732@gmail.com', 'Jobayer Hosen');
    $mail->addAddress('jobaierhosen.4314@gmail.com', 'Jobaier');
    $mail->Subject = 'Testing PHPMailer from Localhost';
    $mail->Body = 'Mail from localhost.';
    // $mail->msgHTML(file_get_contents('index.html'), __DIR__);
    
    /* SMTP parameters. */
    // $mail->SMTPDebug = 2;
    $mail->isSMTP();
    $mail->isHTML(true);
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = TRUE;
    $mail->SMTPSecure = 'tls';
    $mail->Username = 'juba2732@gmail.com';
    $mail->Password = '';
    $mail->Port = 587;
    
    /* Disable some SSL checks. */
    $mail->SMTPOptions = array(
       'ssl' => array(
       'verify_peer' => false,
       'verify_peer_name' => false,
       'allow_self_signed' => true
       )
    );
    
    /* Finally send the mail. */
    if (!$mail->send()) {
        echo $mail->errorInfo;
    } else {
        echo "Message sent successfuly.";
    }
?> 