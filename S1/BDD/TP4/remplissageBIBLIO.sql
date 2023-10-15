
/* 
TUPLES POUR LES DIFFERENTES RELATIONS.
Attention les valeurs sont rentrées en majuscule et il n'y a pas d'accents
*/

/*
Pour mettre les dates au format date avec numero jj-mm-aaaa
*/

ALTER session SET NLS_DATE_FORMAT='DD-MM-YYYY' ; 

/* 
Paramètres d'affichage
*/


SET PAGESIZE 30
COLUMN COLUMN_NAME FORMAT A30
SET LINESIZE 300
/*
Effacer les anciennes valeurs des relations
*/

prompt -------------------------------------------;
prompt --- Suppression des anciens tuples --------;
prompt -------------------------------------------;
DELETE FROM APPAREILS; 
DELETE FROM PHOTOGRAPHIES; 
DELETE FROM CAPTURES; 
DELETE FROM UTILISATEURS;
/*
Insertion des tuples dans les relations
*/

prompt -------------------------------------------;
prompt --- Insertion des nouveaux tuples ---------;
prompt -------------------------------------------;

prompt ------------------------------------------;
prompt -----     insertion utilisateurs    ------------;
prompt ------------------------------------------;

INSERT INTO Utilisateurs VALUES (1, 'JAURES', 'JEAN', 20, 'Jaures.Jean @gmail.com', 'manosquea23r5');
INSERT INTO Utilisateurs VALUES (2, 'FATOU', 'QUENTIN', 17, 'quentin.f@Hotmail.com', 'lagunLake2');
INSERT INTO Utilisateurs VALUES (3, 'MUREAU', 'ROBIN', 32, 'mrob@gmail.com', 'bez34500');
INSERT INTO Utilisateurs VALUES (4, 'COSSU', 'ALEXANDRE', 19, 'alexandrecossu54@outlook.fr', 'alexC220');
INSERT INTO Utilisateurs VALUES (5, 'DAUDIN', 'CHRISTOPHE', 22, 'cdaudin@gmail.com', 'vogoent34');

prompt ------------------------------------------;
prompt -----     insertion appareils     ------------;
prompt ------------------------------------------;

INSERT INTO appareils VALUES (1, 'CanonEOS2', 'CANON', 'BRIDGE');
INSERT INTO appareils VALUES (2, 'NikonE48H', 'NIKON', 'BRIDGE');
INSERT INTO appareils VALUES (3, 'Canon1548H', 'CANON', 'BRIDGE');
INSERT INTO appareils VALUES (4, 'SonyA7s2', 'SONY', 'BRIDGE');
INSERT INTO appareils VALUES (5, 'Iphone12', 'APPLE', 'CAMERAPHONE');

prompt ------------------------------------------;
prompt -----     insertion photographies  ------------;
prompt ------------------------------------------;


INSERT INTO Photographies VALUES (1, 1, 1, '22-04-22', 'GREOUX',  'libre de droits');
INSERT INTO Photographies VALUES (2, 1, 1, '21-04-22', 'VALENSOLE', 'tous droits reservés');
INSERT INTO Photographies VALUES (3, 2, 2, '23-05-22', 'MONTPELLIER',  'utilisations commerciales autorisées');
INSERT INTO Photographies VALUES (4, 3, 3, '13-06-22', 'NÎMES', 'tous droits reservés');
INSERT INTO Photographies VALUES (5, 5, 4, '13-07-21', 'MONTPELLIER', 'utilisations commerciales autorisées');

prompt ------------------------------------------;
prompt -----     insertion captures   --------;
prompt ------------------------------------------;

INSERT INTO Captures VALUES(1, 1, 'Y', 9.7, 21, 2, 100); 
INSERT INTO Captures VALUES(1, 2, 'N', 2.6, 12, 54, 700);
INSERT INTO Captures VALUES(2, 3, 'Y', 1.7, 11, 12, 300);
INSERT INTO Captures VALUES(3, 4, 'N', 3.7, 22, 20, 400);
INSERT INTO Captures VALUES(4, 5, 'N', 4.1, 7, 2, 500);

prompt ------------------------------------------;
prompt -----     insertion terminée  ----------;
prompt ------------------------------------------;