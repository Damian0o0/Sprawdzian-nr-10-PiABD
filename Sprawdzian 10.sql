 --ile mamy miast w krajach zrzeszonych w OPEC których polpuacja jest miedzy 1 mln ludności a 2,5 milnion ludności

select * from city;
select * from is_member;

create view krajeopec as 
select c.name,c.country, c.population, i.organization from city c join is_member i on c.country= i.country where i.organization = 'OPEC' and c.population between 1000000 and 2500000;
 

select * from krajeopec;

drop view krajeopec;

-----------------------------------

--WYŚWIETL 20 KRAJÓW DLA KTÓRYCH MAMY PODANĄ NAJWIĘKSZĄ LICZBĄ MIAST.
--Przekształć widoku poprzez dodatkowe flitrowanie dodając sumę wszystkich miast w danym panstwie
//Zrobione, ale nie pamietam jak sie robi filtrowanie.

select * from city;

create view krajecostam as 

select top 20 country as kod, count(*) as liczba from city 

group by country

order by count(*) desc; 

select * from krajecostam;

drop view krajecostam;


--------------------------------------------------
--WYŚWIETL  liczbę MIAST pogrupuje je WG KODÓW KRAJU NA LITERĘ 'B'
//Zrobione

select * from city;

create view miastanaB as 

select country, COUNT(*) 'LICZBA MIAST' from city 

where country like 'B%' 

group by country;

select * from miastanaB;

drop view miastanaB;

 ------------------------------------------------------------------------------------------------------ 



--ile mamy miast powyżej 1 milionów w UE.
--Zmodyfikuj widok porzez filtrowanie (miasta z zakres  od k do m)
//Zrobione, ale nie pamietam jak sie robi filtrowanie.

select * from city;
select * from is_member;

create view miastaEU as 

select c.name as nazwa, c.population as populacja, i.organization as organizacja from city c 

join is_member i on c.country= i.country where i.organization = 'EU' and c.population > 1000000; 

select * from miastaEU;

drop view miastaEU;
-----------------------------------------------------------
--wyświetl kraje w Australia/Oceania pownizej 5 mln mieszkanców
//Zrobione
select * from country;
select * from encompasses;


create view KrajeWaustralliioceanii as 

select name, continent, population from country c join encompasses e on c.code = e.country 

where population <5000000 and continent = 'Australia/Oceania'; 

select * from KrajeWaustralliioceanii;

drop view KrajeWaustralliioceanii;

--------------------------------------------------

 --podaj max poziom inflacji na każdym kontynencie (economy, encompasses)
//Zrobione
select * from economy;
select * from encompasses;

create view Inflacja as 

select encompasses.continent as kontynent, max(economy.inflation) as inflacja 

from economy join encompasses on economy.country=encompasses.country 

group by continent;

select * from inflacja;

drop view inflacja;

-----------------------