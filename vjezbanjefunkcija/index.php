<?php
echo '<style>body{ background-color:black; color:orange </style>';
// Zadatak 1
// Kreirati funkciju koja prima tri parametra funkcija vraca najveci broj od tri primljena broja koji se nalaze u parametrima funcije
echo '<b>','Zadatak 1.','</b>', '<br>', 'Kreirati funkciju koja prima tri parametra funkcija vraca najveci broj od tri primljena broja koji se nalaze u parametrima funcije';

function najvecibroj($a,$b,$c){
        if ($a>=$b && $a>=$c){
            return $a;   
        }
        if ($b>=$a && $b>=$c){
            return $b;   
        }
        if ($c>=$a && $c>=$b){
            return $c;   
        }
}

echo '<br>','<b>','Odgovor:','</b>','<br>', 'najveći broj od tri odabrana broja 4,4,6 u funkciji je ', '<b style=color:red>',najvecibroj(4,4,6),'</b>';

for ($i=0;$i<5;$i++){
    $a=rand(1,5);
    $b=rand(1,5);
    $c=rand(1,5);
    echo '<br> broj a= ',$a, ', broj b= ', $b, ', broj c= ', $c, '= ', 'naj veći broj usporedbom a/b/c je ','<b style=color:red>',najvecibroj($a,$b,$c),'</b>';
}
unset($a,$b,$c);

// Zadatak 2
// Kreirajte funkciju koja prima dva parametra: duzina i sirina pravokutnika. funkcija vraca povrsinu pravokutnika
echo '<hr/>','<b>','Zadatak 2.','</b>', '<br>', 'Kreirajte funkciju koja prima dva parametra: duzina i sirina pravokutnika. Funkcija vraca povrsinu pravokutnika';

function povrsina($a,$b){
    return $a*$b;
}

echo '<br>','<b>','Odgovor:','</b>','<br>', 'Površina pravokutnika od odabrane dužine 5 i širine 8 u funkciji je ', '<b style=color:red>',povrsina(5,8),'</b>';

// Zadatak 3
// Kreirajte funkciju koja vraca indeksni niz od 10 slucajnih brojeva izmedu 1 i 10
echo '<hr/>','<b>','Zadatak 3.','</b>', '<br>', 'Kreirajte funkciju koja vraca indeksni niz od 10 slucajnih brojeva izmedu 1 i 10';
echo '<br>','<b>','Odgovor:','<br>';

function nizbrojeva(){
    $niz=[];
    for ($i=0;$i<10;$i++){
        $niz[]= rand(1,10);
    }
    return $niz;
}

print_r(nizbrojeva());

// Zadatak 4
//kreirajte funkciju koja prima dva broja i vraca njihov zbroj
echo '<hr/>','<b>','Zadatak 4.','</b>', '<br>', 'Kreirajte funkciju koja prima dva broja i vraca njihov zbroj';
echo '<br>','<b>','Odgovor:';
function zbroj($a,$b){
    return $a+$b;
}

for ($i=0;$i<5;$i++){
    $a=rand(1,5);
    $b=rand(1,5);
    echo '<br> broj a= ',$a, ', broj b= ', $b,'= ', 'zbroj a+b je  ',$a,'+',$b,'=','<b style=color:red>',zbroj($a,$b),'</b>';
}
// Zadatak 5 Kreirajte funkciju koja vraca prvi parni broj odnosno na raspon primljena 2 broja posaljem 4 i 9 vraca 4 posaljem 5 i 9 vraca 6 posaljem 9 i 5 vraca 6 posaljem 5 i 5 vraca false
echo '<hr/>','<b>','Zadatak 5.','</b>', '<br>', 'Kreirajte funkciju koja vraca prvi parni broj odnosno na raspon primljena 2 broja posaljem 4 i 9 vraca 4 posaljem 5 i 9 vraca 6 posaljem 9 i 5 vraca 6 posaljem 5 i 5 vraca false';
unset($a,$b);
$a=rand(1,100);
$b=rand(1,100);
function prviparnibroj($a,$b){
    $od = $a<=$b ? $a : $b;
    $do = $b>=$a ? $b : $a;
    for ($i=$od;$i<$do;$i++){
        if($i%2===0){
            return $i;
        }
    }
    return 'false';
}

echo '<br>','<b>','Odgovor:','<br> broj a= ',$a, ', broj b= ', $b, ' prvi parni broj u rasponu a i b je ','<b style=color:red>',prviparnibroj($a,$b),'</b>';
unset($a);
unset($b);
// zadatak 6 Funkcija prima ime i prezime ispisuje prezime, ime podebljano
echo '<hr/>','<b>','Zadatak 6.','</b>', '<br>', 'Funkcija prima ime i prezime ispisuje prezime, ime podebljano';

function imeprezime($a,$b){
    echo '<br>','<b>','Odgovor:','<br>',' Moje ime je  ','<b style=color:red>',$a,' ',$b,'!','</b>';
}
echo imeprezime('Ivan','Ivanšić');
unset($a);
unset($b);
// Zadatak 7 Funkcija prima broj i vraća ukupan zbroj svih brojeva od 1 do primljenog broja (uključujući primljeni broj)
echo '<hr/>','<b>','Zadatak 7.','</b>', '<br>', 'Funkcija prima broj i vraća ukupan zbroj svih brojeva od 1 do primljenog broja (uključujući primljeni broj)';

function broj($a){
    $sum=0;
    for ($i=1;$i<=$a;$i++){
        $sum+=$i;
    }
    return $sum;  
}
$a=rand(1,20);
echo '<br>','<b>','Odgovor:','<br>',' Od 1 do ', $a, ' suma svih brojeva je ','<b style=color:red>', broj($a), '</b>';



