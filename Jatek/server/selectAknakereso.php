<?php 
require "db.php";

$result = $conn->prepare("SELECT * FROM `aknakereso_eredmenyek`"); //itt adjuk, hogy melyik sql parancsot akarjuk lefuttatni
$result->execute();// ezzel elküldjük a sql szervernek a parancsot és az sql szerver vissza is adja.

//kiíratni az adatokat: 
$result->setFetchMode(PDO::FETCH_ASSOC);
echo json_encode($result->fetchAll());

?>
