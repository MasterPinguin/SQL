/*
autore(NomeAutore, CognomeAutore, Nazionalita, DataNascita)
libro(TitoloLibro, Lingua, NomeAutore, CognomeAutore)
*/

/*creazione della tabella AUTORE*/
create table autore(
    NomeAutore varchar(30),
    CognomeAutore varchar(30),
    Nazionalita varchar(30),
    DataNascita date,
    primary key(NomeAutore, CognomeAutore) /* o NomeAutore varchar(30)primary key,*/
);
/*creazione della tabella LIBRO*/
create table libro(
    TitoloLibro varchar(30),
    Lingua varchar(30),
    NomeAutore varchar(30),
    CognomeAutore varchar(30),
    primary key(TitoloLibro),
    foreign key(NomeAutore, CognomeAutore) references autore(NomeAutore,CognomeAutore)
);

insert into autore(NomeAutore, CognomeAutore, DataNascita, Nazionalita) values
    ('Italo', 'Calvino', '1923-10-15', 'Italia'),
    ('Umberto', 'Saba', '1883-09-03', 'Italia'),
    ('Luigi', 'Pirandello', '1867-06-28', 'Italia');

insert into libro(TitoloLibro, NomeAutore, CognomeAutore, Lingua) values
    ('Le citt‡ invisibili', 'Italo', 'Calvino', 'Italiana'),
    ('Il fu Mattia Pascal', 'Luigi', 'Pirandello', 'Italiana'),
    ('Uno, nessuno e centomila', 'Luigi', 'Pirandello', 'Italiana'),
    ('Trieste e una donna', 'Umberto', 'Saba', 'Italiana'),
    ('Ernesto', 'Umberto', 'Saba', 'Italiana');


/* QUERY */

/* I titoli dei ibri che hanno come autore Luigi Pirandello */
select TitoloLibro
from libro
where NomeAutore='Luigi' and CognomeAutore='Pirandello';

/* I titoli e gli autori dei ibri in lingua italiana */
select TitoloLibro, NomeAutore, CognomeAutore
from libro
where Lingua='italiana';

/* Il numero dei libri che hanno come autoe Umberto Saba */
select count(*) as NumeroLibro
from libro
where NomeAutore='Umberto' and CognomeAutore='Saba';

/* I nomi degli autori i cui cognomi finiscono con la lettera 'o' */
select NomeAutore
from autore
where CognomeAutore like '%o';

/* I nomi degli autori i cui cognomi iniziano con la lettera 'C' */
select NomeAutore
from autore
where CognomeAutore like 'C%';