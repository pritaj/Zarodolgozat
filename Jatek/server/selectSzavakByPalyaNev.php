<?php 
require "db.php";

$palyanev = $_GET['palyanev'];
//megkap egy idt

$result = $conn->prepare("SELECT * FROM `szokereso_szavak` where palya_id =  '".$palyanev."';"); //itt adjuk, hogy melyik sql parancsot akarjuk lefuttatni
$result->execute();// ezzel elküldjük a sql szervernek a parancsot és az sql szerver vissza is adja.

//kiíratni az adatokat: 
$result->setFetchMode(PDO::FETCH_ASSOC);
echo json_encode($result->fetchAll());

?>
