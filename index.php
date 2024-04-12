<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lajkó Gegő</title>
    <link rel="stylesheet" href="stilus.css">
</head>
<body>
    <?php
    $sofor=array("Nagy Zita", "Kiss Lajos", "Hegedűs Zoltán", "Nagy Imre", "Németh Tibor");
    $varos=array("Szolnok","Mezőtúr","Hatvan","Tiszafüred","Boldog");
    $sorszam=array();
    for ($i=0; $i < 5; $i++) { 
       array_push($sorszam, rand(1,200));
    }
    echo "<table> <tr> 
    <th>Név</th> 
    <th> Város neve</th> 
    <th> Busz sorszáma</th>
    </tr>";
    for ($i=0; $i <5 ; $i++) { 
        echo "<tr><td>$sofor[$i] </td>
        <td>$varos[$i] </td>
        <td>$sorszam[$i] </td>
        ";
    }
    echo "</table>";
    ?>
</body>
</html>