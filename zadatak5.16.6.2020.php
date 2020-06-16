<?php

// program unosi 2 broja.

//ako je zbroj dva unesena broja parni tada ispisuje  sve brojeve od 1 do tog parnog broja
//inace ispisuje sve brojeve od tog neparnog broja do 1

//ulaz x=4 i y=5 
//izlaz  1,2,3,4,5,....,20 -> jedno ispod drugog

// ulaz 3 i 7 x=3 y=7
// 21,20,19,18,...,1

$x=4;
$y=7;
$xy=$x+$y;

if ($xy%2==0){
    for ($i=0;$i<$xy;$i++){
        echo $i, '<br>';
    }
}else{
    for ($i=$xy;$i>0;$i--){
        echo $i, '<br>';
    }
}
