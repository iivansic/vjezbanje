#c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova < D:\pp21\vjezbanje\zadatak7.sql
#Zadaci za kolokvij_vjezba_7 (u zagradi je maksimalan broj bodova) 
 #0. Kreirajte tablice (16) i veze između tablica. (6) 
drop database if exists zadatak7;
create database zadatak7;
use zadatak7;

create table punica(
    sifra int not null primary key auto_increment,
    majica varchar(40),
    eura decimal(12,6) not null,
    prstena int,
    cura int not null
);
create table cura(
    sifra int not null primary key auto_increment,
    lipa decimal(12,9) not null,
    introvertno boolean,
    modelnaocala varchar(40),
    narukvica int,
    treciputa datetime,
    kuna decimal(14,9)
);
create table sestra(
    sifra int not null primary key auto_increment,
    bojakose varchar(34) not null,
    hlace varchar(36) not null,
    lipa decimal(15,6),
    stilfrizura varchar(40) not null,
    maraka decimal(12,8) not null,
    prijateljica int
);
create table prijateljica(
    sifra int not null primary key auto_increment,
    haljina varchar(45),
    gustoca decimal(15,10) not null,
    ogrlica int,
    novcica decimal(12,5),
    ostavljen int
);
 create table ostavljen(
    sifra int not null primary key auto_increment,
    lipa decimal(14,6),
    introvertno boolean not null,
    kratkamajica varchar(38) not null,
    prstena int not null,
    zarucnik int
);
create table zarucnik(
    sifra int not null primary key auto_increment,
    vesta varchar(34),
    asocijalno boolean not null,
    modelnaocala varchar(43),
    narukvica int not null,
    novcica decimal(15,5) not null
);
create table zarucnik_mladic(
    sifra int not null primary key auto_increment,
    zarucnik int not null,
    mladic int not null
);
create table mladic(
    sifra int not null primary key auto_increment,
    prstena int,
    lipa decimal(14,5) not null,
    narukvica int not null,
    drugiputa datetime not null
);
alter table zarucnik_mladic add foreign key (mladic) references mladic(sifra);
alter table zarucnik_mladic add foreign key (zarucnik) references zarucnik(sifra);
alter table ostavljen add foreign key (zarucnik) references zarucnik(sifra);
alter table prijateljica add foreign key (ostavljen) references ostavljen(sifra);
alter table sestra add foreign key (prijateljica) references prijateljica(sifra);
alter table punica add foreign key (cura) references cura(sifra);

#1. U tablice prijateljica, ostavljen i zarucnik_mladic unesite po 3 retka. (7) 
 
#2. U tablici punica postavite svim zapisima kolonu eura na vrijednost 15,77. (4) 
 
#3. U tablici sestra obrišite sve zapise čija je vrijednost kolone hlace manje od AB. (4) 
 
#4. Izlistajte kratkamajica iz tablice ostavljen uz uvjet da vrijednost kolone introvertno nepoznate. (6) 
 
#5. Prikažite narukvica iz tablice mladic, stilfrizura iz tablice sestra te gustoca iz tablice prijateljica 
#uz uvjet da su vrijednosti kolone introvertno iz tablice ostavljen poznate te da su vrijednosti kolone 
#asocijalno iz tablice zarucnik poznate. Podatke posložite po gustoca iz tablice prijateljica silazno. (10) 
 
#6. Prikažite kolone asocijalno i modelnaocala iz tablice zarucnik čiji se primarni ključ ne nalaze u tablici zarucnik_mladic. (5)

