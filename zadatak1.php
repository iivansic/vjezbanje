<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<table style="width:100%">
<tr>
<?php
//zadatak1.php
// stranica prima dva brojcana parametra pod kljucevima b1 i b2. 
// program ispisuje u tabličnoj formi sljedeće podatke
// zbroj, razliku, umnožak i kvocijent mora bit dostupno na 
// https://polaznik04.edunova.hr/zadatak1.php
$i=$_GET['b1'];
$j=$_GET['b2'];
echo '<td>', $i + $j, '</td>';
echo '<td>', $i - $j, '</td>';
echo '<td>', $i / $j, '</td>';
echo '<td>', $i * $j, '</td>';
?>
</td>
</tr>
</table>
</body>
</html>

