--table one
create table assassins(
  id serial primary key,
  Full_Name text,
  Code_Names text,
  Weapon text,
  Age integer,
  Price numeric,
  Rating numeric(3,1),
  Kills integer);


insert into assassins(Full_Name, Code_Names, Weapon, Age, Price, Rating, Kills) values
  ('Alexander Duggan', 'The Jackal', 'Sniper rifle', 31, 45, 7.5, 28),
  ('Anton Chigurh','Old Man', 'Pneumatic bolt gun', 52, 40, 9, 72),
  (null, 'Ghost Dog', 'Pistol', 28, 20, 6.5, 35),
  ('Jason Bourne', null, 'Parkour', 27, 25, 7, 48),
  ('John Wick', 'Baba Yaga', 'Lots of guns', 35, 50, 9.5, 433),
  ('Jules Winnfield', null, 'pistol', 26, 15, 6.5, 13),
  ('Leon', 'The Professional', 'Everything', 41, 30, 8.5, 87),
  ('Nikita Mears', 'Nikita, La Femme Nikita', 'Silenced pistols', 28, 30, 7, 32),
  ('Pickle Rick', 'Solenya', 'Lasers and office supplies', 60, 0, 8, 24);

 --table two
  create table targets(
    id serial primary key,
    target_name text,
    target_location text,
    target_photo text,
    target_security numeric,
    client_name varchar(30),
    budget numeric,
    id serial
  );

  insert into targets(target_name, target_location, target_photo, target_security, client_name, budget, id)
    values
    ('Butch Coolidge', 'Los Angeles', 'https://goo.gl/LCquZj', 3, 'Marcellus Wallace', 40, 1),
    ('The Jaguar', 'Russian Embassy', 'https://goo.gl/6JWsiv', 9, 'Concerto', 70, 2),
    ('Norman Stansfield', 'Manhattan', 'https://i.imgur.com/mdIk33E.jpg', 7, 'Mathilda', 35),
    ('Santino DAntonio', 'Continental Hotel', 'https://goo.gl/fUPkYy', 10, 'Winston', 25),
    ('Sonny Valerio', 'Queens', 'https://goo.gl/8DHYUS', 4, 'Ray Vargo', 10);

--table three
create table assassins_contracts(
  assassins_id integer references assassins (id),
  contracts_id integer references contracts (id)
);


  insert into assassins_contracts(assassins_id, contracts_id)
    values(6, 1),
          (1, 2),
          (5, 2),
          (7, 3),
          (9, 5),
          (6, 4),
          (8, 3),
          (3, 1);



--table four
create table clients (
  id serial primary key,
  client_name text
);

insert into clients (id, client_name)
values
('Marcellus Wallace'),
('Concerto'),
('Mathilda'),
('Winston'),
('Ray Vargo')
;

--table five
create table code_names (
  asn_id integer references assassins(id),
  code_name text
);

insert into code_names (assassin_id, code_name)
values
(1, 'The Jackal'),
(2, 'Old Man'),
(3, 'Ghost Dog'),
(5, 'Baba Yaga'),
(7, 'The Professional'),
(8, 'Nikita'),
(8, 'La Femme Nikita'),
(9, 'Solenya')
;

create table contracts (
  id serial primary key,
  target_name foreign(targets.id),
  Client_name foreign(clients.id),
  budget numeric,
  completed boolean,
  completed_by foreign(assassins.id)
);

insert into contracts (target_name, Client_name, budget)
  values
  (default, 1, 1, 40, null),
  (default, 2, 2, 70, null),
  (default, 3, 3, 35, null),
  (default, 4, 4, 25, null),
  (default, 5, 5, 10, null);

select * from assassins;
