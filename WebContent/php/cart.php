<?php
$name = $_GET['name'];
$price = $_GET['price'];
$size = $_GET['size'];
$type = $_GET['type'];
$oitw = $_GET['oitw'];
$photo = $_GET['photo'];
$servername = "jdbc:mysql://localhost:3306?characterEncoding=utf-8";
$username = "root";
$password = "zxcvbnm";
$dbname = "shop";
$conn = mysqli_connect($servername, $username, $password, $dbname);
if (! $conn) {
    die("Connection failed: " . mysqli_connect_error());
}
mysqli_query($conn,'set names utf8');
$sql = "INSERT INTO cart (Gname, Gprice, Gsize, Gtype, Goitw, Gphoto)
VALUES ('$name', '$price', '$size', '$type', '$oitw', '$photo')";

if (mysqli_query($conn, $sql)) {
    echo "ok";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
mysqli_close($conn);
?>