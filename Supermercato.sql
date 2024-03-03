/*
reparto(CodReparto, NumeroCorsie, NumeroReparto, Tipo)
vende(CodReparto, CodiceABarra, DataVendita)
prodotto(CodiceABarra, Descrizione, Peso, Scadenza)
*/

/*creazione della tabella REPARTO*/
create table reparto(
    CodReparto varchar(30),
    NumeroCorsie decimal(10, 0),
    NumeroReparto decimal(10, 0),
    Tipo varchar(30),
    primary key(CodReparto)
);
/*creazione della tabella PRODOTTO*/
create table prodotto(
    CodiceABarra varchar(30),
    Descrizione varchar(200),
    Peso decimal(10, 2),
    Scadenza date,
    primary key(CodiceABarra)
);
/*creazione della tabella VENDE*/
create table vende(
    CodReparto varchar(30),
    CodiceABarra varchar(30),
    DataVendita date,
    primary key(CodReparto, CodiceABarra),
    foreign key(CodReparto) references reparto(CodReparto),
    foreign key(CodiceABarra) references prodotto(CodiceABarra)
);

/* Inserimenti nella tabella REPARTO */
insert into reparto(CodReparto, NumeroCorsie, NumeroReparto, Tipo) values
    ('R1', 5, 10, 'Elettronica'),
    ('R2', 3, 8, 'Abbigliamento'),
    ('R3', 4, 12, 'Cucina'),
    ('R4', 2, 6, 'Libri'),
    ('R5', 6, 15, 'Sport');

/* Inserimenti nella tabella PRODOTTO */
insert into prodotto(CodiceABarra, Descrizione, Peso, Scadenza) values
    ('P001', 'Smartphone', 0.25, '2024-12-31'),
    ('P002', 'Maglietta', 0.15, '2024-06-30'),
    ('P003', 'Padella antiaderente', 1.5, '2025-10-15'),
    ('P004', 'Romanzo Fantasy', 0.8, '2024-08-20'),
    ('P005', 'Scarpe da corsa', 0.35, '2024-11-28');

/* Inserimenti casuali nella tabella VENDE */
insert into vende(CodReparto, CodiceABarra, DataVendita) values
    ('R1', 'P001', '2024-01-15'),
    ('R2', 'P001', '2024-01-16'),
    ('R3', 'P001', '2024-01-17'),
    ('R4', 'P002', '2024-01-18'),
    ('R5', 'P002', '2024-01-19'),
    ('R1', 'P003', '2024-01-20'),
    ('R2', 'P003', '2024-01-21'),
    ('R3', 'P004', '2024-01-22'),
    ('R4', 'P005', '2024-01-23'),
    ('R5', 'P005', '2024-01-24'),
    ('R1', 'P002', '2024-01-25'),
    ('R2', 'P002', '2024-01-26'),
    ('R3', 'P003', '2024-01-27'),
    ('R4', 'P003', '2024-01-1'),
    ('R5', 'P003', '2024-01-13'),
    ('R1', 'P005', '2024-01-3'),
    ('R2', 'P005', '2024-01-15'),
    ('R3', 'P005', '2024-01-4'),
    ('R4', 'P004', '2024-01-5');




/* QUERY */


/* 1.	elencare i nomi dei prodotti che hanno un peso maggiore a 1 g */
select *
from prodotto
where Peso>1;


/* 2.	elencare tutti i prodotti il cui nome finisca con la lettera “a” */
select *
from prodotto
where Descrizione like '%a';

/* 3.	elencare tutti i prodotti il cui nome inizi con la lettera “m” */
select *
from prodotto
where Descrizione like 'm%';

/* 4.	visualizzare il numero delle corsie del reparto “Abbigliamento” */ avg() = media 
select NumeroCorsie
from reparto
where Tipo='Abbigliamento';

/* 5.	visualizzare la media del numero delle corsie presenti nei reparti di “Cucina” ed “Elettronica” */
select avg(reparto.NumeroCorsie) as MediaCorsie
from reparto
where Tipo='Cucina' or Tipo='Elettronica';

/* 6.	visualizzare i codici dei reparti presenti nel supermercato */
select CodReparto
from reparto
where true;

/* 7.	visualizzare i nomi dei prodotti presenti nel supermercato */
select Descrizione
from prodotto
where true;

/* 8.	visualizzare i nomi dei prodotti che hanno una data di scadenza tra il 01/01/2024 e il 31/12/2024 */
select Descrizione
from prodotto
where Scadenza>'2024-01-01' and Scadenza<'2024-12-31';