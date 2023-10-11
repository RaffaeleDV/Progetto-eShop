DROP DATABASE IF EXISTS dbprogetto;
CREATE DATABASE dbprogetto;
USE dbprogetto;

DROP TABLE IF EXISTS utente;
CREATE TABLE IF NOT EXISTS utente(
	nome				 varchar(25),
	cognome 			 varchar(25),
	email				 varchar(25) not null,
	CAP 				 varchar(10),
	indirizzo_spedizione varchar(30) not null,
	data_nascita 		 date,
	admin				 boolean not null,
	password			 varchar(30) not null,
	primary key (email)
);

INSERT INTO utente VALUES ('raffaele', 'della valle', 'raff@gmail.com', 45678, 'via roma 56', '1996-12-12', true, 'raffaele');
INSERT INTO utente VALUES ('fakher', 'ferchichi', 'ferchichi@gmail.com', 45678, 'via roma 56', '1995-12-12', true, 'fakher');
INSERT INTO utente VALUES ('giovanni', 'rossi', 'giovanni@gmail.com', 45678, 'via roma 56', '1995-12-12', false, 'giovanni');

DROP TABLE IF EXISTS cartacredito;
CREATE TABLE IF NOT EXISTS cartacredito(
	pin 				 varchar(10) not null,
	data_scadenza 		 date not null,
	CVV 				 varchar(3) not null,
	credito				 float,	
	proprietario	     varchar(25),
	primary key (pin),
	foreign key (proprietario) references utente(email)
				ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS prodotto;
CREATE TABLE IF NOT EXISTS prodotto(	
	codice_prod 		 int AUTO_INCREMENT,
	nome_prod			 varchar(50),	
	prezzo_prod			 float,
	descrizione_prod	 varchar(100),
	venditore_prod       varchar(25),
	sconto_prod			 int,
	disponibile			 boolean,
	primary key (codice_prod),
	foreign key(venditore_prod) references utente(email)
				ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS fattura;
CREATE TABLE IF NOT EXISTS fattura(	
	compratore_fattura	 varchar(25),
	prodotto_fattura     int,	
	foreign key (compratore_fattura) references utente(email)
				ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (prodotto_fattura) references prodotto(codice_prod)
				ON DELETE CASCADE ON UPDATE CASCADE	         
			
);
