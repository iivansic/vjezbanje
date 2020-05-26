#Zadaci za kolokvij_vjezba_6 (u zagradi je maksimalan broj bodova) 
 
#0. Kreirajte tablice (16) i veze između tablica. (6) 
drop database if exists zadatak6;
create database zadatak6;
use zadatak6;
create table decko(
	sifra int not null primary key auto_increment,
	prviputa datetime,
	modelnaocala varchar(41),
	nausnica int,
	zena int not null
);
create table zena(
	sifra int not null primary key auto_increment,
	novcica decimal(14,8) not null,
	narukvica int not null,
	dukserica varchar(40) not null,
	haljina varchar(30),
	hlace varchar(32),
	brat int not null
);
create table brat(
	sifra int not null primary key auto_increment,
	nausnica int not null,
	treciputa datetime not null,
	narukvica int not null,
	hlace varchar(31),
	prijatelj int
);
create table prijatelj(
	sifra int not null primary key auto_increment,
	haljina varchar(35),
	prstena int not null,
	introvertno boolean,
	stilfrizura varchar(36) not null
);
create table prijatelj_ostavljena(
	sifra int not null primary key auto_increment,
	prijatelj int not null,
	ostavljena int not null
);
create table ostavljena(
	sifra int not null primary key auto_increment,
	oprviputa datetime not null,
	kratkamajica varchar(39) not null,
	drugiputa datetime,
	maraka decimal(14,10)
);
create table svekrva(
	sifra int not null primary key auto_increment,
	hlace varchar(48) not null,
	suknja varchar(42) not null,
	ogrlica int not null,
	treciputa datetime not null,
	dukserica varchar(32) not null,
	narukvica int not null,
	punac int
);
create table punac(
	sifra int not null primary key auto_increment,
	ekstroventno boolean not null,
	suknja varchar(30) not null,
	majica varchar(44) not null,
	prviputa datetime not null
);
alter table svekrva add foreign key (punac) references punac(sifra);
alter table decko add foreign key (zena) references zena(sifra);
alter table zena add foreign key (brat) references brat(sifra);
alter table brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_ostavljena add foreign key (ostavljena) references ostavljena(sifra);
#1. U tablice zena, brat i prijatelj_ostavljena unesite po 3 retka. (7) 
insert into ostavljena (oprviputa,kratkamajica) values
('2020-12-12','smeda');
insert into prijatelj (prstena,stilfrizura) values
(1,'smeda');
insert into prijatelj_ostavljena (prijatelj,ostavljena) values
(1,1),(1,1),(1,1);
insert into brat (nausnica,treciputa,narukvica,prijatelj) values
(1,'2020-12-12',1,1),(1,'2020-12-12',1,1),(1,'2020-12-12',1,1);
insert into zena (novcica,narukvica,dukserica,brat) values
(12.5,1,'smede',1),(12.5,1,'smede',1),(12.5,1,'smede',1);
#2. U tablici svekrva postavite svim zapisima kolonu suknja na vrijednost Osijek. (4) 
update svekrva  set suknja = 'Osijek';
#3. U tablici decko obrišite sve zapise čija je vrijednost kolone modelnaocala manje od AB. (4) 
 delete from decko where modelnaocala != '%ab%';
#4. Izlistajte narukvica iz tablice brat uz uvjet da vrijednost kolone treciputa nepoznate. (6) 
select narukvica from brat where treciputa = null;
#5. Prikažite drugiputa iz tablice ostavljena, zena iz tablice decko te narukvica iz tablice zena 
#uz uvjet da su vrijednosti kolone treciputa iz tablice brat poznate te da su vrijednosti kolone prstena 
#iz tablice prijatelj jednake broju 219. Podatke posložite po narukvica iz tablice zena silazno. (10) 
select ostavljena.drugiputa,decko.zena,zena.narukvica 
from prijatelj_ostavljena inner join ostavljena on prijatelj_ostavljena.ostavljena = ostavljena.sifra 
inner join prijatelj on prijatelj_ostavljena.prijatelj = prijatelj.sifra 
inner join brat on brat.prijatelj = prijatelj.sifra 
inner join zena on zena.brat = brat.sifra 
inner join decko on decko.zena = zena.sifra
where brat.treciputa != null and prijatelj.prstena = 219
order by zena.narukvica desc;
#6. Prikažite kolone prstena i introvertno iz tablice prijatelj čiji se primarni ključ ne nalaze u tablici prijatelj_ostavljena. (5)
select prijatelj.prstena, prijatelj.introvertno 
from prijatelj left join prijatelj_ostavljena on prijatelj_ostavljena.prijatelj=prijatelj.sifra 
where prijatelj_ostavljena.prijatelj is null;


