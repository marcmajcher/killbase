DROP DATABASE killbase;

CREATE DATABASE killbase;

\c killbase;

create table assassins(
  id serial primary key,
  Full_Name text,
  Code_Names text,
  Weapon text,
  Age integer,
  Price numeric,
  Rating numeric(2,1),
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
    client_name text,
    budget numeric
  );

  insert into targets(target_name, target_location, target_photo, target_security)
    values
    ('Butch Coolidge', 'Los Angeles', 'https://goo.gl/LCquZj', 3, 'Marcellus),
    ('The Jaguar', 'Russian Embassy', 'https://goo.gl/6JWsiv', 9),
    ('Norman Stansfield', 'Manhattan', 'https://i.imgur.com/mdIk33E.jpg', 7),
    ('Santino DAntonio', 'Continental Hotel', 'https://goo.gl/fUPkYy', 10),
    ('Sonny Valerio', 'Queens', 'https://goo.gl/8DHYUS', 4);

    create table clients (
      name text,
      id serial primary key
    );

    insert into clients (name)
    values
    ('Marcellus Wallace'),
    ('Concerto'),
    ('Mathilda'),
    ('Winston'),
    ('Ray Vargo');


    create table contracts (
      id serial primary key,
      target_id integer references targets (id),
      client_id integer references clients (id),
      budget integer,
      completed boolean Not NULL,
      assassins_id integer references assassins (id)
    );

    insert into contracts (target_id, client_id, budget, completed, assassins_id)
      values
      (1, 1, 40, false, null),
      (2, 2, 70, false, null),
      (3, 3, 35, false, null),
      (4, 4, 25, false, null),
      (5, 5, 10, false, null);


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


create table code_names (
  assassins_id integer references assassins(id),
  name text
);

insert into code_names (assassins_id, name)
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


select * from assassins;
select * from contracts;
select * from targets;
select * from clients;
select * from code_names;
select * from assassins_contracts;
