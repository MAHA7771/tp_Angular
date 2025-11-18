CREATE TABLE grade(legrade char(10) PRIMARY KEY, nomgrade char(30), hstat
number(3));
CREATE TABLE enseignant(noinsee char(10) primary key, nomp char(10), prenomp
char(10), legrade char(10) REFERENCES grade(legrade), ville char(10));

CREATE TABLE type(letype number(2) PRIMARY KEY, nomtype char(10));
CREATE TABLE filiere(codef char(10) PRIMARY KEY, nomf char(30));
CREATE TABLE UNITE(codef char(10) REFERENCES filiere(codef), nunite char(30), coef
number(2), PRIMARY KEY(codef,nunite));
CREATE TABLE service(noinsee char(10) references enseignant(noinsee), codef char(10),
nunite char(30), letype number(2) REFERENCES type(letype), heures number(3), PRIMARY
KEY(noinsee,codef,nunite,letype));
ALTER TABLE service ADD CONSTRAINT fk_service FOREIGN KEY(codef,nunite)
REFERENCES UNITE(codef,nunite);


INSERT INTO grade (legrade, nomgrade, hstat) VALUES ('A', 'Professeur', 192);
INSERT INTO enseignant (noinsee, nomp, prenomp, legrade, ville) VALUES ('1234567890', 'Dupont', 'Jean', 'A', 'Paris'); INSERT INTO type (letype, nomtype) VALUES (1, 'Cours'); 
INSERT INTO filiere (codef, nomf) VALUES ('INF001', 'Informatique'); 
INSERT INTO UNITE (codef, nunite, coef) VALUES ('INF001', 'Programmation', 2); 
INSERT INTO service (noinsee, codef, nunite, letype, heures) VALUES ('1234567890', 'INF001', 'Programmation', 1, 30);



create or replace procedure pr is
begin
  update grade set hstat=200 where hstat=192;
end;

begin
pr;
end;
--Pour verifier la modification
select * from grade;

create or replace procedure info_grade (grade in char)is
begin
  for cr in (select noinsee, nomp, prenomp, ville FROM enseignant WHERE legrade = grade ) loop
       DBMS_OUTPUT.PUT_LINE('N°: ' || cr.noinsee || ', Nom: ' || cr.nomp || ', Prénom: ' || cr.prenomp || ', Ville: ' || cr.ville);
  end loop;
end;


begin
info_grade('A');
end;