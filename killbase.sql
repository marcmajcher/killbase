DROP DATABASE IF EXISTS killbase;
CREATE DATABASE killbase;
\connect killbase

CREATE TABLE assassins (
  id SERIAL PRIMARY KEY,
  fullname TEXT,
  weapon TEXT,
  contact TEXT,
  price INTEGER,
  rating FLOAT,
  kills INTEGER,
  age INTEGER
);

CREATE TABLE codenames (
  assassinid INTEGER REFERENCES assassins,
  codename TEXT
);

CREATE TABLE targets (
  id SERIAL PRIMARY KEY,
  name TEXT,
  location TEXT,
  photo TEXT,
  securitylevel INTEGER
);

CREATE TABLE clients (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE contracts (
  id SERIAL PRIMARY KEY,
  targetid INTEGER REFERENCES targets,
  clientid INTEGER REFERENCES clients,
  budget INTEGER,
  completed BOOLEAN DEFAULT false,
  completedby INTEGER REFERENCES assassins
);

CREATE TABLE assassin_contracts (
  assassinid INTEGER REFERENCES assassins,
  contractid INTEGER REFERENCES contracts
);

INSERT INTO assassins (fullname, weapon, contact, age, price, rating, kills)
  VALUES
('Alexander Duggan', 'Sniper rifle', 'jackal@gmail.com', 31, 45, 7.5, 28),
('Anton Chigurh', 'Pneumatic bolt gun', 'pneujackcity@gmail.com', 52, 40, 9, 72),
('', 'Pistol', 'ghostdog@gmail.com', 28, 20, 6.5, 35),
('Jason Bourne', 'Parkour', 'jb@gmail.com', 27, 25, 7, 48),
('John Wick', 'Lots of guns', 'babayaga@gmail.com', 35, 50, 9.5, 433),
('Jules Winnfield', 'Pistol', 'bmf@gmail.com', 26, 15, 6.5, 13),
('Leon', 'Everything', 'leon@gmail.com', 41, 30, 8.5, 87),
('Nikita Mears', 'Silenced pistols', 'nikita@gmail.com', 28, 30, 7, 32),
('Pickle Rick', 'Lasers and office supplies', 'rsanchez@gmail.com', 60, 0, 8, 24);

INSERT INTO codenames (assassinid, codename)
  VALUES
(1, 'The Jackal'),
(2, 'Old Man'),
(3, 'Ghost Dog'),
(5, 'Baba Yaga'),
(7, 'The Professional'),
(8, 'Nikita'),
(8, 'La Femme Nikita'),
(9, 'Solenya');

INSERT INTO clients (name)
  VALUES
  ('Marcellus Wallace'),
  ('Concerto'),
  ('Mathilda'),
  ('Winston'),
  ('Ray Vargo');

INSERT INTO targets (name, location, photo, securitylevel)
  VALUES
('Butch Coolidge', 'Los Angeles', 'https://goo.gl/LCquZj', 3),
('The Jaguar', 'Russian Embassy', 'https://goo.gl/6JWsiv', 9),
('Norman Stansfield', 'Manhattan', 'https://i.imgur.com/mdIk33E.jpg', 7),
('Santino D''Antonio', 'Continental Hotel', 'https://goo.gl/fUPkYy', 10),
('Sonny Valerio', 'Queens', 'https://goo.gl/8DHYUS', 4);

INSERT INTO contracts (targetid, clientid, budget)
  VALUES
(1, 1, 40),
(2, 2, 70),
(3, 3, 35),
(4, 4, 25),
(5, 5, 10);

INSERT INTO assassin_contracts (assassinid, contractid) VALUES
  (6, 1),
  (1, 2),
  (5, 2),
  (7, 3),
  (9, 5),
  (6, 4),
  (8, 3),
  (3, 1);
