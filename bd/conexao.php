<?php

$dsn = 'mysql:dbname=projeto_final_web;host=localhost;charset=utf8';
$user = 'root';
$password = '';

try{
  $conn = new PDO($dsn, $user, $password);
}catch (PDOException $e){
  die('DB Error: ' . $e->getMessage());
}

?>