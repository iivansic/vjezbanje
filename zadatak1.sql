drop database if exists zadatci;
create database zadatci;
use zadatci;

create table sestra(
	sifra int not null primary key,
	introvertno boolean,
	haljina varchar(31) not null,
	maraka decimal(17,6),
	hlace varchar(46),
	narukvica int
);

create table punac(
	sifra int not null primary key,
	ogrlica int,
	gustoca decimal(14,9),
	hlace varchar(41) not null
);

create table cura(
	sifra int not null primary key,
	novcica decimal(16,5) not null,
	gustoca decimal (18,6) not null,
	lipa decimal (13,10),
	ogrlica int not null,
	bojakose varchar(38),
	suknja varchar(38),
	punac int
);

create table zena(
	sifra int not null primary key,
	treciputa datetime,
	hlace varchar(46),
	kratkamajica varchar(31) not null,
	jmbag char(11),
	bojaociju varchar(39) not null,
	haljina varchar(44),
	sestra int not null
);

create table sestra_svekar(
	sifra int not null primary key,
	sestra int not null,
	svekar int not null
);

create table svekar(
	sifra int not null primary key,
	bojaociju varchar(40) not null,
	prstena int,
	dukserica varchar(41),
	lipa decimal(13,8),
	eura decimal(12,7),
	majica varchar(35)
);

create table muskarac (
	sifra int not null primary key,
	bojaociju varchar(50) not null,
	hlace varchar(30),
	modelnaocala varchar(43),
	maraka decimal(14,5) not null,
	zena int not null
);

create table mladic (
	sifra int not null,
	suknja varchar(50) not null,
	kuna decimal (16,8) not null,
	drugiputa datetime,
	asocijalno boolean,
	ekstroventno boolean not null,
	dukserica varchar(48) not null,
	muskarac int
);

alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
alter table zena add foreign key (sestra) references sestra(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table cura add foreign key (punac) references punac(sifra);

#1. U tablice muskarac, zena i sestra_svekar unesite po 3 retka. (7) 
insert into svekar(sifra,bojaociju,prstena,dukserica,lipa,eura,majica) values
(1,'smeda', 1, 'smeda', 12.5,12.5,'smeda'),
(2,'smeda', 1, 'smeda', 12.5,12.5,'smeda'),
(3,'smeda', 1, 'smeda', 12.5,12.5,'smeda');
insert into sestra (sifra,introvertno,haljina,maraka,hlace,narukvica) values
(1,true,'smeda','12.5','smede',1),
(2,true,'smeda','12.5','smede',1),
(3,true,'smeda','12.5','smede',1);
insert into sestra_svekar(sifra,sestra,svekar) values
(1,1,1),
(2,2,2),
(3,3,3);
insert into zena (sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra) values
(1,'2020-12-12 12:12:12','smeda','smeda','12345678910','smeda','smeda', 1),
(2,'2020-12-12 12:12:12','smeda','smeda','12345678910','smeda','smeda', 2),
(3,'2020-12-12 12:12:12','smeda','smeda','12345678910','smeda','smeda', 3);
insert into muskarac (sifra,bojaociju,hlace,modelnaocala,maraka,zena) values
(1,'smeda','smeda','smeda',12.5,1),
(2,'smeda','smeda','smeda',12.5,2),
(3,'smeda','smeda','smeda',12.5,3);

#2. U tablici cura postavite svim zapisima
# kolonu gustoca na vrijednost 15,77.
#describe cura;
insert into cura(sifra,novcica,gustoca,ogrlica) values
(1,10.00,20.00,1);
update cura set gustoca=15.77;

#3. U tablici mladic 
#obrišite sve zapise čija je vrijednost kolone kuna veće od 15,78.
delete from mladic where kuna>15.77;

#4. Izlistajte kratkamajica iz 
#tablice zena uz uvjet da vrijednost kolone hlace sadrže slova ana. (6) 

select kratkamajica from zena where kratkamajica = '%ana%';

#5. Prikažite dukserica iz tablice svekar,
#asocijalno iz tablice mladic te hlace iz tablice muskarac
#uz uvjet da su vrijednosti kolone hlace iz tablice zena počinju slovom
#a te da su vrijednosti kolone haljina iz tablice sestra sadrže niz znakova ba.
#Podatke posložite po hlace iz tablice muskarac silazno. (10) 
#svaku tablicu treba samo jednom navesti (napomena od profesora)
select svekar.dukserica, mladic.asocijalno, muskarac.hlace
from mladic inner join muskarac on mladic.muskarac = muskarac.sifra
inner join zena on muskarac.zena = zena.sifra
inner join sestra on zena.sestra = sestra.sifra 
inner join sestra_svekar on sestra_svekar.sestra = sestra.sifra
inner join svekar on sestra_svekar.svekar = svekar.sifra
where sestra.haljina like '%ba%'
order by muskarac.hlace desc;

#6. Prikažite kolone haljina i maraka iz tablice sestra čiji se primarni ključ 
#ne nalaze u tablici sestra_svekar. (5)


select sestra.haljina, sestra.maraka from sestra left join sestra_svekar on sestra.sifra=sestra_svekar.sestra
where sestra_svekar.sestra is null;



select sestra.haljina, sestra.maraka
from sestra left join sestra_svekar on sestra.sifra = sestra_svekar.sestra
where sestra_svekar.sestra is null;


















