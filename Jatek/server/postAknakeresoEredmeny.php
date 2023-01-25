<?php
require "db.php";
$json = file_get_contents('php://input');

$data = json_decode($json);

$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$sql = "INSERT INTO aknakereso_eredmenyek (nev, palya, masodperc)
VALUES ('".$data->nev."', ".$data->palya.", ".$data->masodperc.")";
$conn->exec($sql);
?>