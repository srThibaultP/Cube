<?php

$host     = 'localhost';
$db       = 'BDDCube';
$user     = 'root';
$password = 'snir';

$pdo = new PDO( "mysql:host=$host;dbname=$db", $user, $password, [
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
]);
?>
