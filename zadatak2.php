<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
h1, address, span {
  display: inline-block;
  vertical-align: middle;
}



</style>
<body style="width:100%">
<?php
// zadatak2.php
// stranica prima tri parametra pod ključevima
// naziv, adresa i mjesto. Program označava vrijednost pod
// nazivom s h1 oznakom, vrijednost adresa s address oznakom
// te vrijednost mjesto s span oznakom.
// sve tri vrijednosti prikazane su vizualno jedne pokraj drugih
// https://polaznikXX.edunova.hr/zadatak1.php?b1=2&b2=3
$i=$_GET['naziv'];
$j=$_GET['adresa'];
$k=$_GET['mjesto'];


echo '<h1 style="text-align:left;float:">', 'Naziv: ', $i, '</h1>',
'<address style="font-size:33px;"> ',"&nbsp&nbsp"  ,'Adresa: ', $j,  '</address>',
'<span style="font-size:33px;">', "&nbsp&nbsp", 'Mjesto: ' ,  $k , '</span>';
echo '<br>';
echo '<br>';
echo '<br>';
echo '<br>';
echo '<br>';
echo '<br>';
echo '<br>';

echo '<h3>mislim da sam tek sad skonto šta je zadatak od mene trazio, ak vidite ovo ja sam nešt zabrijao
    da je potrebno labele metnit u ove oznake h1 span itd a vrijednosti obično :D 
</h3>';




?>

  <?php echo $_SERVER['SERVER_ADDR'];
 
    
    ?>



</body>
</html>



