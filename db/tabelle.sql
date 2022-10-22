DROP SCHEMA IF EXISTS casadiscografica;
CREATE SCHEMA casadiscografica;
USE casadiscografica;

-- tabelle indipendenti

CREATE TABLE MUSICSHOW(
	Nome varchar(15) primary key,
	Via varchar(20) not null,
	Civico varchar(5) not null,
	CAP char (5) not null,
	Giorno varchar(10) default "Domenica",
	OraInizio time default "14:00:00"
);

CREATE TABLE IDOL(
	Pseudonimo varchar(10) primary key,
	Nome varchar(20) not null,
	Cognome varchar(20) not null,
    unique(Nome,Cognome),
    Sesso char(1) not null check (Sesso = 'M' OR Sesso = 'F'),
    Posizione varchar(10) not null,
	DataNascita date not null,
	LuogoNascita varchar(20) not null,
	Estensione varchar(15) check ((Sesso = 'M' AND(Estensione = 'Tenore' OR Estensione = 'Baritono' OR Estensione = 'Basso')) OR (Sesso = 'F' AND(Estensione = 'Soprano' OR Estensione = 'MezzoSoprano' OR Estensione = 'Contralto'))),
	Flow varchar(10)
);

CREATE TABLE DISCO(
	AN char(13) primary key,
	Titolo varchar(20) not null,
	NumeroBrani int not null,
	Durata int not null,
	DataPubblicazione date not null
);

CREATE TABLE AUTORE(
	NomeArte varchar(15) primary key,
	Nome varchar(20) not null,
	Cognome varchar(20) not null,
	unique(Nome,Cognome)
);

-- tabelle dipendenti

CREATE TABLE BRANO(
	Titolo varchar(20),
	Idol varchar(10) references IDOL(Pseudonimo),
	Durata int not null,
	Titletrack boolean,
	DataPubblicazione date,
	CodiceDisco char(13),
    primary key(Titolo,Idol),
	foreign key(CodiceDisco) references DISCO(AN)
);

CREATE TABLE SOCIAL(
	Username varchar(20) primary key,
	Idol varchar(10) references IDOL(Pseudonimo)
);

CREATE TABLE REALIZZAZIONE(
	NomeArte varchar(15),
	Titolo varchar(20),
	Idol varchar(10),
    primary key(NomeArte,Titolo,Idol),
	foreign key(NomeArte) references AUTORE(NomeArte),
	foreign key(Titolo,Idol) references BRANO(Titolo,Idol)
);

CREATE TABLE ESIBIZIONE(
	ShowOspitante varchar(15),
	BranoEseguito varchar(20),
	IdolEsibito varchar(10),
    IsOnline boolean,
	DataEsibizione date,
    Backtrack boolean,
	primary key(ShowOspitante,BranoEseguito,IdolEsibito,DataEsibizione),
    foreign key(ShowOspitante) references MUSICSHOW(Nome),
    foreign key(BranoEseguito,IdolEsibito) references BRANO(Titolo,Idol)
);
