<?php
session_start();


// verificar si el usuario ya esta autenticado
if (isset($_SESSION["usuario"]) && $_SESSION["usuario"] === true) {
    header("Location: index.php");
    exit();
}

if($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    mysqli_connect("localhost","root","manolo221212","");
}


?>

