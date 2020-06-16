<?php
//stranica ispisuje sve parne brojeve od 1 do 100 1 je modulo 1 da prikaze parne da je 0 prikazao bi neparne


// drugi nacin
for ($i=1;$i<100;$i++){
    if ($i%2 ==1){
        echo $i, '<br/>';
    }
}
?>