<?php
$email = "dmarlovic83@gmail.com";
$message = $_POST["message"];
$from = $_POST["email"];
$headers = 'From:' . $from . "\r\n" . 'Reply-To:' . $from . "\r\n" .'X-Mailer: PHP/' . phpversion();
if (mail($email, "Email from superherbal webpage", $message, $headers)) {echo '<p> Your email has been sent to us we will get back to you as soon as possible. Click here to return to the main page</p> <a href="http://127.0.0.1:3030/Superherbal/web/about_us.html">Go back to the main page</a>'; }
else echo "mail could not be sent";
?>