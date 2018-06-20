DROP DATABASE killbase;
CREATE DATABASE killbase;
\c killbase; 

CREATE TABLE Assassins (assassin_id serial primary key, name text, rating float, check(rating BETWEEN 0 AND 10), weapon_of_choice text, minimum_fee integer, age integer, kills integer);

INSERT INTO Assassins (name, weapon_of_choice, age, minimum_fee, rating, kills) VALUES 
('Alexander Duggan', 'Sniper rifle', '31', '45', '7.5', '28'),
('Anton Chigurh', 'Pneumatic bolt gun', '52', '40', '9', '72'),
('Ghost Dog', 'Pistol', '28', '20', '6.5', '35'),
('Jason Bourne', 'Parkour', '27', '25', '7', '48'),
('John Wick', 'Lots of guns', '35', '50', '9.5', '433'),
('Jules Winnfield', 'Pistol', '26', '15', '6.5', '13'),
('Leon', 'Everything', '41', '30', '8.5', '87'),
('Nikita Mears', 'Silenced pistols', '28', '30', '7', '32'),
('Pickle Rick', 'Lasers and office supplies', '60', '0', '8', '24');

CREATE TABLE Assassin_Codenames (assassin integer references assassins (assassin_id), codename text); 

INSERT INTO Assassin_Codenames (assassin, codename) VALUES 
('1', 'The Jackal'),
('2', 'Old Man'),
('3', 'Ghost Dog'),
('5', 'Baba Yaga'),
('7', 'The Professional'),
('8', 'Nikita'),
('8', 'La Femme Nikita'),
('9', 'Solenya');


CREATE TABLE Targets (target_id serial, PRIMARY KEY (target_id), name text, location text, photo text, security_level text);

INSERT INTO Targets (name, location, photo, security_level) VALUES 
('Butch Coolidge','Los Angeles','https://goo.gl/LCquZj','3'),
('The Jaguar','Russian Embassy','https://goo.gl/6JWsiv','9'),
('Norman Stansfield','Manhattan','https://i.imgur.com/mdIk33E.jpg','7'),
('Santino D''Antonio','Continental Hotel','https://goo.gl/fUPkYy','10'),
('Sonny Valerio','Queens','https://goo.gl/8DHYUS','4');


CREATE TABLE Clients (client_id serial, PRIMARY KEY (client_id), name text);

INSERT INTO Clients (name) VALUES 
('Marcellus Wallace'),
('Concerto'),
('Mathilda'),
('Winston'),
('Ray Vargo');


CREATE TABLE Contracts (contract_id serial, PRIMARY KEY (contract_id), target integer references Targets(target_id), client integer references Clients (client_id), budget integer, complete_status boolean, by_who integer references Assassins (assassin_id));


CREATE TABLE Assassins_Contracts (assassin integer references Assassins (assassin_id), contract integer references Contracts (contract_id));


INSERT INTO contracts (target, client, budget) VALUES 
('1','1','40'),
('2','2','70'),
('3','3','35'),
('4','4','25'),
('5','5','10');

TABLE assassins;
TABLE assassin_codenames;
TABLE clients;
TABLE targets;
TABLE contracts; 
TABLE assassins_contracts; 







