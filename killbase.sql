DROP DATABASE killbase;
CREATE DATABASE killbase;
\c killbase; 

CREATE TABLE Assassins (assassin_id serial primary key, name text, rating float, check(rating BETWEEN 0 AND 10), weapon_of_choice text, minimum_fee integer, age integer, kills integer);

INSERT INTO Assassins (name, weapon_of_choice, age, minimum_fee, rating, kills) VALUES 
('Alexander Duggan', 'Sniper rifle', '31', '45', '7.5', '28'),
('Anton Chigurh', 'Pneumatic bolt gun', '52', '40', '9', '72'),
INSERT INTO Assassins (name, weapon_of_choice, age, minimum_fee, rating, kills) VALUES 
INSERT INTO Assassins (name, weapon_of_choice, age, minimum_fee, rating, kills) VALUES ('Ghost Dog', 'Pistol', '28', '20', '6.5', '35');
INSERT INTO Assassins (name, weapon_of_choice, age, minimum_fee, rating, kills) VALUES ('Jason Bourne', 'Parkour', '27', '25', '7', '48');
INSERT INTO Assassins (name, weapon_of_choice, age, minimum_fee, rating, kills) VALUES ('John Wick', 'Lots of guns', '35', '50', '9.5', '433');
INSERT INTO Assassins (name, weapon_of_choice, age, minimum_fee, rating, kills) VALUES ('Jules Winnfield', 'Pistol', '26', '15', '6.5', '13');
INSERT INTO Assassins (name, weapon_of_choice, age, minimum_fee, rating, kills) VALUES ('Leon', 'Everything', '41', '30', '8.5', '87');
INSERT INTO Assassins (name, weapon_of_choice, age, minimum_fee, rating, kills) VALUES ('Nikita Mears', 'Silenced pistols', '28', '30', '7', '32');
INSERT INTO Assassins (name, weapon_of_choice, age, minimum_fee, rating, kills) VALUES ('Pickle Rick', 'Lasers and office supplies', '60', '0', '8', '24');

CREATE TABLE Assassin_Codenames (assassin references Assassins (assassin_id), codename text); 

INSERT INTO Codenames (assassin, codename) VALUES ('1', 'The Jackal');
INSERT INTO Codenames (assassin, codename) VALUES ('2', 'Old Man');
INSERT INTO Codenames (assassin, codename) VALUES ('3', 'Ghost Dog');
INSERT INTO Codenames (assassin, codename) VALUES ('5', 'Baba Yaga');
INSERT INTO Codenames (assassin, codename) VALUES ('7', 'The Professional');
INSERT INTO Codenames (assassin, codename) VALUES ('8', 'Nikita, La Femme Nikita');
INSERT INTO Codenames (assassin, codename) VALUES ('9', 'Solenya');


CREATE TABLE Targets (target_id serial, PRIMARY KEY (target_id), name text, location text, photo text, security_level text);

INSERT INTO Targets (name, location, photo, securitylevel) VALUES ('Butch Coolidge','Los Angeles','https://goo.gl/LCquZj','3');
INSERT INTO Targets (name, location, photo, securitylevel) VALUES ('The Jaguar','Russian Embassy','https://goo.gl/6JWsiv','9');
INSERT INTO Targets (name, location, photo, securitylevel) VALUES ('Norman Stansfield','Manhattan','https://i.imgur.com/mdIk33E.jpg','7');
INSERT INTO Targets (name, location, photo, securitylevel) VALUES ('Santino D''Antonio','Continental Hotel','https://goo.gl/fUPkYy','10');
INSERT INTO Targets (name, location, photo, securitylevel) VALUES ('Sonny Valerio','Queens','https://goo.gl/8DHYUS','4');


CREATE TABLE Clients (client_id serial, PRIMARY KEY (client_id), name text);

INSERT INTO Clients (name) VALUES ('Marcellus Wallace');
INSERT INTO Clients (name) VALUES ('Concerto');
INSERT INTO Clients (name) VALUES ('Mathilda');
INSERT INTO Clients (name) VALUES ('Winston');
INSERT INTO Clients (name) VALUES ('Ray Vargo');


CREATE TABLE Assassins_Contracts (assassin references Assassins (assassin_id), contract references Contracts (contract_id));


CREATE TABLE Contracts (contract_id serial, PRIMARY KEY (contract_id), target integer references Targets(target_id), client integer references Clients (client_id), budget integer, complete_status boolean, by_who references Assassins (assassin_id));

INSERT INTO contracts (target, client, budget) VALUES ('1','1','40');
INSERT INTO contracts (target, client, budget) VALUES ('2','2','70');
INSERT INTO contracts (target, client, budget) VALUES ('3','3','35');
INSERT INTO contracts (target, client, budget) VALUES ('4','4','25');
INSERT INTO contracts (target, client, budget) VALUES ('5','5','10');







