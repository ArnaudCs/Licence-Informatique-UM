/*
Suppression des relations 
*/
/*
*************************************************
ATTENTION NE PAS TOUCHER AUX LIGNES SUIVANTES
ELLES PERMETTENT DE SUPPRIMER PROPREMENT LES RELATIONS
*************************************************
*/
prompt "Suppression des relations"

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE APPAREILS';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE PHOTOGRAPHIES';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE UTILISATEURS';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE CAPTURES';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

/*
*************************************************
*/

/*
Création des relations 
*/

prompt "Création des relations"

CREATE TABLE Utilisateurs(
	id INT NOT NULL, 
	nom VARCHAR2(255) NOT NULL, 
	prenom VARCHAR2(255) NOT NULL, 
	age INT NOT NULL, 
	email VARCHAR2(255) NOT NULL, 
	motdepasse VARCHAR2(255) NOT NULL, 
	CONSTRAINT UTILISATEURS_PK PRIMARY KEY (id) ON DELETE CASCADE
);

CREATE TABLE Photographies(
	id INT NOT NULL, 
	idAppareil INT NOT NULL,
	idUtilisateur INT NOT NULL,
	datePhoto TIMESTAMP NOT NULL,
	lieu VARCHAR2(255) NOT NULL, 
	Licence VARCHAR2(50) CHECK( Licence IN ('tous droits reservés', 'libre de droits', 'utilisations commerciales autorisées')), 
	constraint PHOTOGRAPHIES_PK PRIMARY KEY (id) ON DELETE CASCADE
);

CREATE TABLE Appareils(
	id INT NOT NULL, 
	nom VARCHAR2(255) NOT NULL, 
	marque VARCHAR2(255) NOT NULL, 
	type VARCHAR2(255) NOT NULL, 
	constraint APPAREILS_PK PRIMARY KEY (id) ON DELETE CASCADE
);

CREATE TABLE Captures(
	idAppareil INT NOT NULL, 
	idPhotographie INT NOT NULL, 
	flash CHAR(1) CHECK (flash IN ('N','Y')) NOT NULL, 
	ouvertureFocale FLOAT NOT NULL, 
	tempsExposition FLOAT NOT NULL, 
	distanceFocale FLOAT NOT NULL, 
	ISO INT NOT NULL, 
	constraint CAPTURES_PK PRIMARY KEY (idAppareil, idPhotographie) ON DELETE CASCADE
);

ALTER TABLE Captures ADD CONSTRAINT Captures_fk0 FOREIGN KEY (idAppareil) REFERENCES Appareils(id) ON DELETE CASCADE;
ALTER TABLE Captures ADD CONSTRAINT Captures_fk1 FOREIGN KEY (idPhotographie) REFERENCES Photographies(id) ON DELETE CASCADE;

ALTER TABLE Photographies ADD CONSTRAINT Photographies_fk0 FOREIGN KEY (idAppareil) REFERENCES Appareils(id) ON DELETE CASCADE;
ALTER TABLE Photographies ADD CONSTRAINT Photographies_fk1 FOREIGN KEY (idUtilisateur) REFERENCES Utilisateurs(id) ON DELETE CASCADE;

