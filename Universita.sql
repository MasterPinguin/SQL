/*
studente(MatricolaStudente, NomeStudente, CognomeStudente, Codice_fiscale, facolta)
esame(CodEsame, NomeEsame, Docente, CFU)
esito(MatricolaStudente, CodEsame, Data_sostenimento, Voto)
*/

/*creazione della tabella studente*/
create table studente(
    MatricolaStudente varchar(30),
    NomeStudente varchar(30),
    CognomeStudente varchar(30),
    Codice_fiscale varchar(30),
    facolta varchar(30),
    primary key(MatricolaStudente)
);
/*creazione della tabella esame*/
create table esame(
    CodEsame varchar(30),
    NomeEsame varchar(30),
    Docente varchar(30),
    CFU varchar(30),
    primary key(CodEsame)
);
/*creazione della tabella esito*/
create table esito(
    MatricolaStudente varchar(30),
    CodEsame varchar(30),
    Data_sostenimento varchar(30),
    Voto varchar(30),
    primary key(MatricolaStudente, CodEsame),
    foreign key(MatricolaStudente) references studente(MatricolaStudente),
    foreign key(CodEsame) references prodotto(CodEsame)
);


/* Inserimenti nella tabella studente */
insert into studente(MatricolaStudente, CognomeStudente, NomeStudente, CodiceFiscale, Facolta) values
('55601','Rossi', 'Marco', 'RSSMRC93A16F205U', 'Scienze Matematiche'),
('55633','Viola', 'Giuseppe', 'VLIGPP91H16G388D', 'Scienze Matematiche'),
('55619','Bianchi', 'Anna', 'BNCNNA92M52C933F', 'Ingegneria'),
('55641','Neri', 'Matteo', 'NREMTT93E27F205K', 'Ingegneria');

/* Inserimenti nella tabella esame */
insert into esame (CodEsame, NomeEsame, Docente, cfu) values
('ES0001', 'Tecnologia e Sviluppo Web', 'Filippo Rossini', 9),
('ES0002', 'Algoritmi e Strutture Dati', 'Antonello Verdi', 6),
('ES0003', 'Elettrotecnica', 'Annalisa Rosa', 9),
('ES0004', 'Fisica 1', 'Carmine Rossi', 6);

/* Inserimenti casuali nella tabella esito */
insert into esito (MatricolaStudente, CodEsame, DataSostenimento, Voto) values
('55601', 'ES0002', '2013-09-17', 27),
('55601', 'ES0001', '2013-11-25', 25),
('55633', 'ES0001', '2013-11-25', 30),
('55619', 'ES0003', '2013-04-07', 22),
('55619', 'ES0004', '2013-07-14', 25);


/* Le Join in SQL */


/* I nomi degli esami sostenuti dallo studente Marco Rossi*/
select esame.NomeEsame
from esito,esame,studente
where studente.NomeStudente="Marco" and 
studente.CognomeStudente="Rossi" and 
studente.MatricolaStudente=esito.MatricolaStudente and
esame.CodEsame=esito.CodEsame;

/* Il giudizio ottenuto dallo studente Marco Rossi all'esame di Algoritmi e Strutture Dati*/
select esame.Voto
from esito,esame,studente
where studente.NomeStudente="Marco" and 
studente.CognomeStudente="Rossi" and
esame.NomeEsame="Algoritmi e Strutture Dati" and
studente.MatricolaStudente=esito.MatricolaStudente and
esame.CodEsame=esito.CodEsame;

/* I nomi e i cognomi degli studenti che hanno ottenuto un giudizio superiore a 26 nell'esame di "Tecnologia e Sviluppo Web"*/
select studente.NomeStudente,studente.CognomeStudente
from esito,esame,studente
where esito.Voto>26 and
esame.NomeEsame="Tecnologia e Sviluppo Web" and
studente.MatricolaStudente=esito.MatricolaStudente and
esame.CodEsame=esito.CodEsame;

/*  */
select count(*) as NomeEsame
from esito,esame
where studente.NomeStudente="Anna" and
studente.CognomeStudente="Bianchi" and
studente.MatricolaStudente=esito.MatricolaStudente;

/*  */
select avg(esito,Voto) as MediaVoto
from esito,studente
where studente.NomeStudente="Marco" and
studente.CognomeStudente="Rossi" and
esito.MatricolaStudente=studente.MatricolaStudente;