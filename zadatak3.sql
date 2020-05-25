#Zadaci za kolokvij_vjezba_2 (u zagradi je maksimalan broj bodova) 
 
#0. Kreirajte tablice (16) i veze između tablica. (6) 
drop database if exists zadatak3;
create database zadatak3;
use zadatak3;

create table svekar(
	sifra int primary key not null,
	novcica decimal(17,8) not null,
	suknja varchar(44) not null,
	bojakose varchar(36),
	prstena int,
	narukvica int,
	cura int
);

create table cura(
	sifra int primary key not null,
	dukserica varchar(49), 
	maraka decimal(13,7),
	drugiputa datetime,
	majica varchar(49),
	novcica decimal(15,8),
	ogrlica int not null
);

create table ostavljena(
	sifra int primary key not null,
	kuna decimal(17,5),
	lipa decimal(15,6),
	majica varchar(36),
	modelnaocala varchar(31) not null,
	prijatelj int
);

create table prijatelj(
	sifra int primary key not null,
	kuna decimal(16,10),
	haljina varchar(37),
	lipa decimal(13,10),
	dukserica varchar(31),
	indiferentno boolean not null
);
 
create table snasa(
	sifra int primary key not null,
	introvertno boolean,
	kuna decimal(15,6) not null,
	eura decimal(12,9) not null,
	treciputa datetime,
	ostavljena int not null
);

create table punica (
	sifra int primary key not null,
	asocijalno boolean,
	kratkamajica varchar(44),
	kuna decimal(13,8) not null,
	vesta varchar(32),
	snasa int
);
create table prijatelj_brat(
	sifra int primary key not null,
	prijatelj int not null,
	brat int not null
);

create table brat(
	sifra int primary key not null,
	jmbag char(11),
	ogrlica int not null,
	ekstroventno boolean not null
);

alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);

alter table punica add foreign key (snasa) references snasa(sifra);

alter table snasa add foreign key (ostavljena) references ostavljena(sifra);

alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);

alter table svekar add foreign key (cura) references cura(sifra);

#1.  U tablice snasa, ostavljena i prijatelj_brat unesite po 3 retka. (7)  
insert into brat (sifra,ogrlica,ekstroventno) values
(1,3, 1),
(2,2, 1),
(3,1, 1);
insert into prijatelj (sifra, indiferentno) values
(1,2);
insert into prijatelj_brat (sifra,prijatelj,brat) values
(1,1,1),
(2,1,2),
(3,1,3);
insert into ostavljena(sifra,modelnaocala) values
(1,'crni'),
(2,'crni'),
(3,'crni');
#2.  U tablici svekar postavite svim zapisima kolonu suknja na vrijednost Osijek. (4) 
update svekar  set suknja='osijek';
#3.  U tablici punica obrišite sve zapise čija je vrijednost kolone kratkamajica jednako AB. (4) 
 delete from punica where kratkamajica like '%AB%';
#4. Izlistajte majica iz tablice ostavljena uz uvjet da vrijednost kolone lipa nije 9,10,20,30 ili 35. (6)  
select majica from ostavljena where lipa != 9 or lipa !=10 or lipa !=20 or lipa !=30 or lipa !=35;
#5. Prikažite ekstroventno iz tablice brat, vesta iz tablice punica te kuna iz tablice snasa uz uvjet da su 
#vrijednosti kolone lipa iz tablice ostavljena različito od 91 te da su vrijednosti kolone haljina iz tablice
#prijatelj sadrže niz znakova ba. Podatke posložite po kuna iz tablice snasa silazno. (10)  
 
select brat.ekstroventno, punica.vesta, snasa.kuna 
from prijatelj_brat inner join brat on prijatelj_brat.brat = brat.sifra
inner join prijatelj on prijatelj_brat.prijatelj = prijatelj.sifra 
inner join ostavljena on ostavljena.prijatelj = prijatelj.sifra
inner join snasa on snasa.ostavljena = ostavljena.sifra 
inner join punica on punica.snasa = snasa.sifra
where ostavljena.lipa != 91 and prijatelj.haljina = "ba"
order by snasa.kuna desc;

#6. Prikažite kolone haljina i lipa iz tablice prijatelj čiji se primarni ključ ne nalaze u tablici prijatelj_brat. (5)
select prijatelj.haljina, prijatelj.lipa 
from prijatelj left join prijatelj_brat on prijatelj.sifra=prijatelj_brat.prijatelj
where prijatelj_brat.prijatelj is null;













