<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zadatak2</title>
</head>
<style>
h1, address, span, h3 {
  display: inline-block;
  vertical-align: middle;
}
</style>
<body style="width:100%; background-color:pink;">
<form method="_GET">
Ime: <input type="text" name="ime" required>
Adresa: <input type="text" name="adresa" required>
Mjesto: <input  type="text" name="mjesto" required><br> 
<br>
<input type="submit">
<input type="reset">

</form>
Ispuni formu te kad završiš pritisni pošalji (ne mora se tipkati u browser na ovaj način).
<br>
<?php
error_reporting(E_ALL & ~E_NOTICE);
$i=$_GET['ime'];
$j=$_GET['adresa'];
$k=$_GET['mjesto'];
if ($i=="" or $j=="" or $k=="") {
    echo '<h1>Pozdrav molio bih te da ispuniš polja!</h1>';
    goto preskocisve;
}
echo '<h1 style="text-align:left;float:">', 'Ime: ', $i, '</h1>',
'<address style="font-size:33px;"> ',"&nbsp&nbsp"  ,'Adresa: ', $j,  '</address>',
'<span style="font-size:33px;">', "&nbsp&nbsp", 'Mjesto: ' ,  $k , '</span>';
echo '<br>';
echo '<h3>Ti se zoveš', "&nbsp", $i, '</h3>,',"&nbsp",
'<h3>nalaziš se na adresi: ', $j,'</h3>,', "&nbsp",'<h3>iz mjesta: ',  $k,'.</h3>';
preskocisve:
error_reporting(-1);
echo '<br>';
echo '<img src="https://picsum.photos/201/200">';
echo '<img src="https://picsum.photos/202/200">';
echo '<img src="https://picsum.photos/203/200">';
echo '<img src="https://picsum.photos/204/200">';
?>
<br><br><br><br><br><br><br><br><br><br><br> <address>made by Ivanšić</address> 
  <?php echo $_SERVER['SERVER_ADDR'];
    ?>
</body>
</html>



