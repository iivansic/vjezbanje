<?php
// stranica prima tri broja putem GET metode
// stranica ispisuje najveći primljeni brj

$i=$_GET['broj1'];
$j=$_GET['broj2'];
$k=$_GET['broj3'];
// domaca zadaca broj1=4 broj2=4 broj3=3
if ($i >= $j & $i >= $k) {
    echo $i;
}elseif($j > $i & $j >= $k){
    echo $j;
}else{
    echo $k;
}
