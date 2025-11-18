-- Table IMMEUBLE
CREATE TABLE Immeuble (
    adresse VARCHAR(255) PRIMARY KEY,
    nbEtages INT NOT NULL,
    dateConstruction DATE NOT NULL,
    nomProprietaire VARCHAR(100) NOT NULL
);

-- Insérer des immeubles
INSERT INTO Immeuble VALUES ('10 rue A', 6, TO_DATE('1945-05-10', 'YYYY-MM-DD'), 'Alice');
INSERT INTO Immeuble VALUES ('20 rue B', 3, TO_DATE('1980-07-15', 'YYYY-MM-DD'), 'Bob');
INSERT INTO Immeuble VALUES ('30 rue C', 7, TO_DATE('1930-03-01', 'YYYY-MM-DD'), 'Alice');
INSERT INTO Immeuble VALUES ('40 rue D', 5, TO_DATE('2000-11-20', 'YYYY-MM-DD'), 'Charlie');


-- Table APPARTEMENT
CREATE TABLE Appartement (
    adresse VARCHAR(255),
    numAppartement  INT unique,
    nomOccupant VARCHAR(100),
    type VARCHAR(10),
    superficie FLOAT,
    etage INT,
    PRIMARY KEY (adresse, numAppartement),
    FOREIGN KEY (adresse) REFERENCES Immeuble(adresse)
);

-- Insérer des appartements
INSERT INTO Appartement VALUES ('10 rue A', 101, 'Alice', 'T2', 55.0, 1);
INSERT INTO Appartement VALUES ('10 rue A', 102, NULL, 'T3', 75.0, 2);
INSERT INTO Appartement VALUES ('20 rue B', 201, 'Bob', 'T1', 40.0, 1);
INSERT INTO Appartement VALUES ('30 rue C', 301, NULL, 'T2', 60.0, 3);
-- Table PERSONNE
CREATE TABLE Personne (
    nom VARCHAR(100),
    adresse VARCHAR(255)REFERENCES Immeuble(adresse), 
    numAppartement INT references Appartement(numAppartement),   
    dateArrivee DATE,
    dateDepart DATE,
    age INT,
    profession VARCHAR(100),
    PRIMARY KEY (nom, adresse) 
);

-- Insérer des personnes
INSERT INTO Personne VALUES ('Alice', '10 rue A', 101, TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL, 30, 'Architecte');
INSERT INTO Personne VALUES ('Bob', '20 rue B', 201, TO_DATE('2022-06-01', 'YYYY-MM-DD'), NULL, 35, 'Professeur');
INSERT INTO Personne VALUES ('Charlie', '30 rue C', 301, TO_DATE('2023-03-15', 'YYYY-MM-DD'), NULL, 28, 'Etudiant');
INSERT INTO Personne VALUES ('David', '40 rue D', 102, TO_DATE('2023-01-10', 'YYYY-MM-DD'), NULL, 40, 'Médecin');


--1
set serveroutput ON
create or replace procedure pr is
    cursor cr is  
    select adresse,nomProprietaire
    from immeuble
    where nbEtages>5 and dateConstruction< TO_DATE('1950-01-01', 'YYYY-MM-DD')
;
begin
    for c in cr loop
    dbms_output.put_line('Adresse:'||c.adresse||'  nomProprietaire:' || c.nomProprietaire);
    end loop;
end;

begin
pr();
end;
--2
create or replace function nb_personne return int
is
nb INT;
begin
select count(*)
into nb
from Personne p,Immeuble i
where p.adresse=i.adresse and p.nom=i.nomProprietaire;
return nb;
end;


begin
dbms_output.put_line(nb_personne());
end;



--3
create or replace procedure prop is
cursor cr is 
select p.nom,p.adresse
from Personne p ,Immeuble i
where p.adresse=i.adresse and p.nom!=i.nomProprietaire;
begin
 for c in cr loop
    dbms_output.put_line('Nom: '||c.nom||'Adresse'||c.adresse);
 
 end loop;
end;

begin
prop;
end;


--4
create or replace procedure  prop_vide is
cursor cr is 
 select nom,profession
 from Personne p,Immeuble i,Appartement a
 where p.adresse=i.adresse and p.numAppartement=a.numAppartement and p.nom=i.nomProprietaire and a.nomOccupant is null;
begin
    for c in cr loop
    dbms_output.put_line('Nom: '||c.nom||'  Profession:'||c.profession);
 
 end loop;
end ;


begin
prop_vide;
end;












