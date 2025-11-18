CREATE TABLE Articles (
    Refart VARCHAR(20) PRIMARY KEY,
    Libart VARCHAR(100),
    Coulart VARCHAR(30),
    Pvart DECIMAL(10, 2),
    Qstart INT,
    Paart DECIMAL(10, 2)
);

INSERT INTO Articles (Refart, Libart, Coulart, Pvart, Qstart, Paart) VALUES
('A001', 'Stylo Bille', 'Bleu', 1.50, 100, 0.50);
INSERT INTO Articles (Refart, Libart, Coulart, Pvart, Qstart, Paart) VALUES
('A002', 'Cahier 96p', 'Vert', 2.00, 200, 0.80);
INSERT INTO Articles (Refart, Libart, Coulart, Pvart, Qstart, Paart) VALUES
('A003', 'Gomme', 'Blanc', 0.75, 150, 0.30);
INSERT INTO Articles (Refart, Libart, Coulart, Pvart, Qstart, Paart) VALUES
('A200', 'Gomme', 'Blanc', 0.75, 150, 0.30);

CREATE TABLE Clients (
    Codeclt VARCHAR(20) PRIMARY KEY,
    Nomclt VARCHAR(50),
    Prenonclt VARCHAR(50),
    Cateclt VARCHAR(30),
    Adrclt VARCHAR(100),
    Cpclt VARCHAR(10),
    Villeclt VARCHAR(50)
);

INSERT INTO Clients (Codeclt, Nomclt, Prenonclt, Cateclt, Adrclt, Cpclt, Villeclt) VALUES
('C001', 'Durand', 'Marie', 'Particulier', '12 rue de la Paix', '75001', 'Paris');
INSERT INTO Clients (Codeclt, Nomclt, Prenonclt, Cateclt, Adrclt, Cpclt, Villeclt) VALUES
('C002', 'Martin', 'Luc', 'Entreprise', '45 avenue des Champs', '69003', 'Lyon');
INSERT INTO Clients (Codeclt, Nomclt, Prenonclt, Cateclt, Adrclt, Cpclt, Villeclt) VALUES
('C003', 'Dupont', 'Claire', 'Particulier', '78 boulevard Haussmann', '13008', 'Marseille');


CREATE TABLE Commandes (
    Numcom INT PRIMARY KEY,
    Datecom DATE,
    Codeclt VARCHAR(20),
    FOREIGN KEY (Codeclt) REFERENCES Clients(Codeclt)
);


INSERT INTO Commandes (Numcom, Datecom, Codeclt) VALUES
(1001, to_Date('2025-04-20','yyyy-mm-dd'), 'C001');
INSERT INTO Commandes (Numcom, Datecom, Codeclt) VALUES
(1002, to_Date('2025-04-21','yyyy-mm-dd'), 'C002');
INSERT INTO Commandes (Numcom, Datecom, Codeclt) VALUES
(1003, to_Date('2025-04-22','yyyy-mm-dd'), 'C001');

CREATE TABLE LigCom (
    Numcom INT,
    Refart VARCHAR(20),
    Qtecom INT,
    PRIMARY KEY (Numcom, Refart),
    FOREIGN KEY (Numcom) REFERENCES Commandes(Numcom),
    FOREIGN KEY (Refart) REFERENCES Articles(Refart)
);

INSERT INTO LigCom (Numcom, Refart, Qtecom) VALUES
(1001, 'A001', 10);
INSERT INTO LigCom (Numcom, Refart, Qtecom) VALUES
(1001, 'A003', 5);
INSERT INTO LigCom (Numcom, Refart, Qtecom) VALUES
(1002, 'A002', 20);
INSERT INTO LigCom (Numcom, Refart, Qtecom) VALUES
(1003, 'A001', 15);
INSERT INTO LigCom (Numcom, Refart, Qtecom) VALUES
(1003, 'A002', 10);
INSERT INTO LigCom (Numcom, Refart, Qtecom) VALUES
(1003, 'A200', 10);

set SERVEROUTPUT on;
--1
declare
cursor cr is 
 select Numcom 
 from LigCom  
 where Qtecom>4 and Refart='A200';
begin 
  for ligne in cr loop
     dbms_output.put_line('num commande:'|| ligne.Numcom);
  end loop;
end;

--2
create or replace procedure afficher_liste is
  cursor cr is 
  select Numcom 
 from LigCom 
 where Qtecom>4 and Refart='A200';
 begin 
  for ligne in cr loop
     dbms_output.put_line('num commande'|| ligne.Numcom);
  end loop;
 end;

begin
afficher_liste();
end;


--3
declare
 nb number :=0;
 begin 
   select count(Numcom)
    into nb
    from LigCom 
   where Qtecom>4 and Refart='A200';
  dbms_output.put_line('le nombre de commandes dant la quantité commandée de l’article A200 est supérieure à 4:'||nb);                      
end;
--4
create or replace function nombre_commande 
return int
is
nb number :=0;
begin 
   select count(Numcom)
    into nb
    from LigCom 
   where Qtecom>4 and Refart='A200';
  return nb;                    
end;

declare 
nb number;
begin 
nb :=nombre_commande();
dbms_output.put_line('le nombre est '||nb);
end ;


--5
create or replace function moin_cher 
 return number is
 min_p number;
 begin
 select min(Pvart)
 into min_p
 from Articles;
 return min_p;
 end;
/
declare
 cursor cr is
 select refart,libart,Pvart
 from Articles
 where Pvart=moin_cher();
begin
 for ligne in cr loop
DBMS_OUTPUT.PUT_LINE('La liste des articles les moins chers à l’achat : ' || ligne.refart || ' - ' || ligne.libart || ' - ' ||  TO_CHAR(ligne.Pvart, 'FM9990.00'));

 end loop;
end;



--6

CREATE OR REPLACE PROCEDURE procnbrCat(
    out_liste OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN out_liste FOR
        SELECT Cateclt , COUNT(*) AS nb_client
        FROM Clients
        GROUP BY Cateclt
        HAVING COUNT(*) > 50;
END;
/


--7
create or replace procedure procMajpv (valdif Articles.pvart%TYPE, paugt NUMBER) is
cursor cr is 
select Pvart,Paart 
from Articles;
pr number;
begin
for ligne in cr loop
   pr:=ligne.Pvart-ligne.Paart;
   if pr<valdif then
       update Articles set Pvart=Pvart+(paugt/100) where Pvart=ligne.Pvart and Paart = ligne.Paart  ;
        COMMIT; 
    end if;
end loop;
end;

begin
  procMajpv(0.1,5);
end;

--Pour verifier l'augmentation
select * from articles;
