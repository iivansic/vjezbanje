#Zadaci za kolokvij_vjezba_5 (u zagradi je maksimalan broj bodova) 
 
#0. Kreirajte tablice (16) i veze između tablica. (6) 
drop database if exists zadatak5;
create database zadatak5;
use zadatak5;

create table mladic(
	sifra int not null primary key auto_increment,
	kratkamajica varchar(48) not null,
	haljina varchar(30) not null,
	asocijalno boolean,
	zarucnik int
);
create table zarucnik(
	sifra int not null primary key auto_increment,
	jmbag char(11),
	lipa decimal(12,8),
	indiferentno boolean not null
);
create table svekar(
	sifra int not null primary key auto_increment,
	bojakose varchar(33),
	majica varchar(31),
	carape varchar(31) not null,
	haljina varchar(43),
	narukvica int,
	eura decimal(14,5) not null
);
create table punac(
	sifra int not null primary key auto_increment,
	dukserica varchar(33),
	prviputa datetime not null,
	majica varchar(36),
	svekar int not null
);
create table svekar_cura(
	sifra int not null primary key auto_increment,
	svekar int not null,
	cura int not null
);
create table cura(
	sifra int not null primary key auto_increment,
	carape varchar(41) not null,
	maraka decimal(17,10) not null,
	asocijalno boolean,
	vesta varchar(47) not null
);
create table punica(
	sifra int not null primary key auto_increment,
	hlace varchar(43) not null,
	nausnica int not null,
	ogrlica int,
	vesta varchar(49) not null,
	modelnaocala varchar(31) not null,
	treciputa datetime not null,
	punac int not null
);
create table ostavljena(
	sifra int not null primary key auto_increment,
	majica varchar(33),
	ogrlica int not null,
	carape varchar(44),
	stilfrizura varchar(42),
	punica int not null
);
alter table mladic add foreign key (zarucnik) references zarucnik(sifra);
alter table punac add foreign key (svekar) references svekar(sifra);
alter table svekar_cura add foreign key (svekar) references svekar(sifra);
alter table svekar_cura add foreign key (cura) references cura(sifra);
alter table punica add foreign key (punac) references punac(sifra);
alter table ostavljena add foreign key (punica) references punica(sifra);
#1. U tablice punica, punac i svekar_cura unesite po 3 retka. (7) 
 insert into cura (carape,maraka,vesta) values 
 ('smede',16.5,'smeda');
insert into svekar(carape,eura) values
('smeda',12.5);
insert into svekar_cura (svekar,cura) values
(1,1),(1,1),(1,1);
insert into punac (prviputa,svekar) values
('2020-12-12 12-12-12',1),('2020-12-12 12-12-12',1),('2020-12-12 12-12-12',1);
insert into punica (hlace,nausnica,vesta,modelnaocala,treciputa,punac) values
('smede',2,'smeda','smeda','2020-12-12 12-12-12',1),('smede',2,'smeda','smeda','2020-12-12 12-12-12',1),
('smede',2,'smeda','smeda','2020-12-12 12-12-12',1);
#2. U tablici mladic postavite svim zapisima kolonu haljina na vrijednost Osijek. (4) 
 update mladic set haljina='osijek';
#3. U tablici ostavljena obrišite sve zapise čija je vrijednost kolone ogrlica jednako 17. (4) 
 delete from ostavljena where ogrlica=17;
#4. Izlistajte majica iz tablice punac uz uvjet da vrijednost kolone prviputa nepoznate. (6) 
 select majica from punac where prviputa = null;
#5. Prikažite asocijalno iz tablice cura, stilfrizura iz tablice ostavljena te nausnica iz tablice punica uz uvjet 
#da su vrijednosti kolone prviputa iz tablice punac poznate te da su vrijednosti kolone majica iz tablice svekar sadrže 
#niz znakova ba. Podatke posložite po nausnica iz tablice punica silazno. (10) 
select cura.asocijalno,ostavljena.stilfrizura,punica.nausnica 
from svekar_cura inner join cura on svekar_cura.cura = cura.sifra 
inner join svekar on svekar_cura.svekar = svekar.sifra 
inner join punac on punac.svekar = svekar.sifra 
inner join punica on punica.punac = punac.sifra
inner join ostavljena on ostavljena.punica = punica.sifra
where punac.prviputa != null and svekar.majica like '%ba%'
order by punica.nausnica desc;
#6. Prikažite kolone majica i carape iz tablice svekar čiji se primarni ključ ne nalaze u tablici svekar_cura. (5)
select svekar.majica,svekar.carape 
from svekar left join svekar_cura on svekar_cura.svekar = svekar.sifra 
where svekar_cura.sifra = null;
