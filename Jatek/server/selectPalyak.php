<?php 
require "db.php";
$conn-> exec("set names utf8");

$result = $conn->prepare("SELECT id,neve FROM `szokereso_palyak` GROUP BY neve ORDER BY id;"); //itt adjuk, hogy melyik sql parancsot akarjuk lefuttatni
$result->execute();// ezzel elküldjük a sql szervernek a parancsot és az sql szerver vissza is adja.

//kiíratni az adatokat: 
$result->setFetchMode(PDO::FETCH_ASSOC);
echo json_encode($result->fetchAll());

?>
