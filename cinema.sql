/*
attori(Cod_Attore, Nome, Anno_Nascita, Nazionalita)
film(Cod_Film, Titolo, Anno_Produzione, Nazionalita, Regista, Genere)
sale(Cod_Sala, Posti, Nome, Citta)
recita(Cod_Attore, Cod_Film)
proiezioni(Cod_Proiezione, Cod_Film, Cod_Sala, Incasso, Data_Proiezione)
*/

/*creazione della tabella attori*/
create table attori (
    Cod_Attore int primary key,
    Nome varchar(255),
    Anno_Nascita int,
    Nazionalita varchar(255)
);

/*creazione della tabella film*/
create table film (
    Cod_Film int primary key,
    Titolo varchar(255),
    Anno_Produzione int,
    Nazionalita varchar(255),
    Regista varchar(255),
    Genere varchar(255)
);

/*creazione della tabella sale*/
create table sale (
    Cod_Sala int primary key,
    Posti int,
    Nome varchar(255),
    Citta varchar(255)
);

/*creazione della tabella recita*/
create table recita (
    Cod_Attore int,
    Cod_Film int,
    foreign key (Cod_Attore) references attori(Cod_Attore),
    foreign key (Cod_Film) references film(Cod_Film),
    primary key (Cod_Attore, Cod_Film)
);

/*creazione della tabella proiezioni*/
create table proiezioni (
    Cod_Proiezione int primary key,
    Cod_Film int,
    Cod_Sala int,
    Incasso decimal(10, 2),
    Data_Proiezione date,
    foreign key (Cod_Film) references film(Cod_Film),
    foreign key (Cod_Sala) references sale(Cod_Sala)
);

/* Inserimenti nella tabella attori */
insert into attori (Cod_attore, Nome, Anno_Nascita, Nazionalita) values
(1, 'John Doe', 1980, 'Italy'),
(2, 'Federico Fellini', 1985, 'France'),
(3, 'Alice Johnson', 1992, 'Germany'),
(4, 'Bob Smith', 1978, 'USA'),
(5, 'Eva Brown', 1989, 'Germany'),
(6, 'Chris Taylor', 1975, 'UK'),
(7, 'Maria Garcia', 1982, 'Spain'),
(8, 'Luca Rossi', 1995, 'Italy'),
(9, 'Sophie Martin', 1990, 'France'),
(10, 'Max Mueller', 1987, 'Germany');

/* Inserimenti nella tabella film */
insert into film (Cod_Film, Titolo, Anno_Produzione, Nazionalita, Regista, Genere) values
(11, 'Dreamland', 2020, 'USA', 'David Yates', 'Fantasy'),
(12, 'The Grand Budapest Hotel', 2014, 'Italy', 'Wes Anderson', 'Comedy'),
(13, 'The Dark Knight', 2008, 'USA', 'Christopher Nolan', 'Action'),
(14, 'La La Land', 2016, 'USA', 'Damien Chazelle', 'Musical'),
(15, 'The Shawshank Redemption', 1994, 'USA', 'Frank Darabont', 'Drama'),
(16, 'Parasite', 2019, 'South Korea', 'Bong Joon-ho', 'Thriller'),
(17, 'The Great Gatsby', 2013, 'USA', 'Baz Luhrmann', 'Romance'),
(18, 'The Social Network', 2010, 'France', 'David Fincher', 'Biography'),
(19, 'Forrest Gump', 1994, 'USA', 'Robert Zemeckis', 'Romance'),
(20, 'The Pianist', 2002, 'Poland', 'Roman Polanski', 'Biography');

/* Inserimenti nella tabella sale */
insert into sale (Cod_Sala, Posti, Nome, Citta) values
(11, 120, 'Sala 11', 'Berlin'),
(12, 90, 'Sala 12', 'Pisa'),
(13, 150, 'Sala 13', 'Rome'),
(14, 80, 'Sala 14', 'Madrid'),
(15, 110, 'Sala 15', 'London'),
(16, 100, 'Sala 16', 'Berlin'),
(17, 130, 'Sala 17', 'Paris'),
(18, 70, 'Sala 18', 'Rome'),
(19, 140, 'Sala 19', 'Madrid'),
(20, 95, 'Sala 20', 'London');

/* Inserimenti nella tabella recita */
insert into recita (Cod_Attore, Cod_Film) values
(1, 11),
(2, 12),
(3, 13),
(4, 14),
(5, 15),
(6, 16),
(7, 17),
(8, 18),
(9, 19),
(10, 20);

/* Inserimenti nella tabella proiezioni */
insert into proiezioni (Cod_Proiezione, Cod_Film, Cod_Sala, Incasso, Data_Proiezione) values
(11, 11, 11, 5500.00, '2024-03-01'),
(12, 12, 12, 4200.00, '2024-03-02'),
(13, 13, 13, 3800.00, '2024-03-03'),
(14, 14, 14, 6000.00, '2024-03-04'),
(15, 15, 15, 5100.00, '2024-03-05'),
(16, 16, 16, 4800.00, '2024-03-06'),
(17, 17, 17, 5300.00, '2024-03-07'),
(18, 18, 18, 4900.00, '2024-03-08'),
(19, 19, 19, 5600.00, '2024-03-09'),
(20, 20, 20, 4500.00, '2024-03-10');


/* QUERY */

/*1. Il nome di tutte le sale di Pisa*/
select nome
from sale
where citta = 'Pisa';

/*2. Il titolo dei film di F. Fellini prodotti dopo il 1960.*/
select titolo
from film
where regista = 'Federico Fellini' and 
anno_produzione > 1960;

/*3. Il titolo e la durata dei film di fantascienza giapponesi o francesi prodotti dopo il 1990*/
select titolo, anno_produzione
from film
where (nazionalita = 'Japan' or nazionalita = 'France') and 
genere = 'Fantascienza' and 
anno_produzione > 1990;

/*4. Il titolo dei film di fantascienza giapponesi prodotti dopo il 1990 oppure francesi*/
select titolo
from film
where (nazionalita = 'Japan' and genere = 'Fantascienza' and anno_produzione > 1990) or 
(nazionalita = 'France' and genere = 'Fantascienza');
