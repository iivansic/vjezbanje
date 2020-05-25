#Zadaci za kolokvij_vjezba_2 (u zagradi je maksimalan broj bodova) 
 
#0. Kreirajte tablice (16) i veze između tablica. (6) 
 #22:49
 drop database if exists zadatak2;
create database zadatak2;
use zadatak2;

create table cura(
	sifra int primary key not null,
	haljina varchar(33) not null,
	drugiputa datetime not null,
	suknja varchar(38),
	narukvica int,
	introvertno boolean,
	majica varchar(40) not null,
	decko int
);

create table decko(
	sifra int not null primary key,
	indiferentno boolean,
	vesta varchar(34),
	asocijalno boolean not null
);

create table decko_zarucnica (
	sifra int not null primary key,
	decko int not null,
	zarucnica int not null
);

create table prijatelj (
	sifra int primary key not null,
	modelnaocala varchar(37),
	treciputa datetime not null,
	ekstroventno boolean not null,
	prviputa datetime,
	svekar int not null
);

create table svekar (
	sifra int not null primary key,
	stilfrizura varchar(48),
	ogrlica int not null,
	asocijalno boolean not null
);

create table zarucnica(
	sifra int not null primary key,
	narukvica int,
	bojakose varchar(37) not null,
	novcica decimal(15,9),
	lipa decimal(15,8) not null,
	indiferentno boolean not null
);

create table neprijatelj (
	sifra int not null primary key,
	majica varchar(32),
	haljina varchar(43) not null,
	lipa decimal(16,8),
	modelnaocala varchar(49) not null,
	kuna decimal(12,6) not null,
	jmbag char(11),
	cura int
);

create table brat(
	sifra int not null primary key,
	suknja varchar(47),
	ogrlica int not null,
	asocijalno boolean not null,
	neprijatelj int not null
);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table cura add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table prijatelj add foreign key (svekar) references svekar(sifra);



#1. U tablice neprijatelj, cura i decko_zarucnica unesite po 3 retka. (7) 
insert into decko (sifra,asocijalno) values
(1,1),
(2,1),
(3,1);
insert into cura (sifra,haljina,drugiputa,majica,decko) values
(1,'smeda','2020-12-12 12-00-00','smeda',1),
(2,'smeda','2020-12-12 12-00-00','smeda',1),
(3,'smeda','2020-12-12 12-00-00','smeda',1);
insert into neprijatelj (sifra,haljina,modelnaocala,kuna,cura) values
(1,'smeda','crni',12.5,1),
(2,'smeda','crni',12.5,1),
(3,'smeda','crni',12.5,1);
insert into zarucnica (sifra,bojakose,lipa,indiferentno) values
(1,'smeda', 25.5,1),
(2,'smeda', 25.5,1),
(3,'smeda', 25.5,1);

insert into decko_zarucnica (sifra,decko,zarucnica) values
(1,1,1),
(2,1,1),
(3,1,1);
#2. U tablici prijatelj postavite svim zapisima kolonu treciputa na vrijednost 30. travnja 2020. (4) 
update prijatelj set treciputa ='2020-04-30';
#3. U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica različito od 14. (4) 
delete from brat where ogrlica != 14;
#4. Izlistajte suknja iz tablice cura uz uvjet da vrijednost kolone drugiputa nepoznate. (6) 
select suknja from  cura where drugiputa = null;
#5. Prikažite novcica iz tablice zarucnica, 
#neprijatelj iz tablice brat te haljina iz tablice neprijatelj uz uvjet da 
#su vrijednosti kolone drugiputa iz tablice cura poznate te da su vrijednosti
#kolone vesta iz tablice decko sadrže niz znakova ba. Podatke posložite po haljina iz tablice neprijatelj silazno. (10) 

select zarucnica.novcica, brat.neprijatelj, neprijatelj.haljina 
from zarucnica inner join decko_zarucnica on decko_zarucnica.zarucnica = zarucnica.sifra 
inner join decko on decko_zarucnica.decko = decko.sifra 
inner join cura on cura.decko = decko.sifra 
inner join neprijatelj on neprijatelj.cura = cura.sifra 
inner join brat on brat.neprijatelj = neprijatelj.sifra
where cura.drugiputa > 0 and decko.vesta like '%ba%'
order by neprijatelj.haljina desc;
#6. Prikažite kolone vesta i asocijalno iz tablice decko čiji se primarni ključ ne nalaze u tablici decko_zarucnica. (5)
select decko.vesta, decko.asocijalno
from decko left join decko_zarucnica on decko.sifra = decko_zarucnica.decko
where decko_zarucnica.decko is null;

#22:49-23:18
#29 min.

