<?php
session_start();
require 'admin/inc/db_config.php';

$conn = $GLOBALS['con'];

// Get form data
$name = $_POST['name'];
$email = $_POST['email'];
$address = $_POST['address'];
$phone = $_POST['phonenum'];
$pin = $_POST['pincode'];
$dob = $_POST['dob'];
$profile = $_FILES['profile']['name'];
$password = $_POST['pass'];
$cpass = $_POST['cpass'];

// File upload path
$targetDir = "uploads/";
$targetFilePath = $targetDir . basename($profile);
move_uploaded_file($_FILES["profile"]["tmp_name"], $targetFilePath);

// Prepare SQL statement
$stmt = $conn->prepare("INSERT INTO user_cred (name, email, address, phonenum, pincode, dob, profile, password, confirm_password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("sssssssss", $name, $email, $address, $phone, $pin, $dob, $profile, $password, $cpass);

// Execute the statement
if ($stmt->execute()) {
    // Store user information in the session
    $_SESSION['user'] = [
        'name' => $name,
        'email' => $email,
        'profile' => $targetFilePath
    ];
    echo "<script>alert('Registered successfully');</script>";
    header("Location: index.php");
    exit();
} else {
    echo "Error: " . $stmt->error;
}

// Close the statement and connection
$stmt->close();
$conn->close();
?>
