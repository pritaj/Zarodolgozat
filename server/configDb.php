<?php
$host="localhost";
$db_name="munkalatok";
$db_username="root";
$db_password="";
$options=[
    PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC
];
try{
    $db=new PDO("mysql:host=$host;dbname=$db_name;charset=utf8",$db_username,$db_password,$options);
}catch(PDOException $e){
    echo "hiba-sikertelen adatbázis kapcsolódás:".$e->getMessage();
}

?>