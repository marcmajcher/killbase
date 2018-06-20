--creating my first table:
create table Assassins(Full_Name text, Code_Names text, Weapon text, Age numeric, Price numeric, Rating numeric(3,1), Kills numeric);

--inserting data into first table:
insert into Assassins(Full_Name, Code_Names, Weapon, Age, Price, Rating, Kills) values('Alexander Duggan', 'The Jackal', 'Sniper rifle', 31, 45, 7.5, 28)

  insert into Assassins values('Alexander Duggan', 'The Jackal', 'Sniper rifle', 31, 45, 7.5, 28);

  insert into Assassins values('Anton Chigurh','Old Man', 'Pneumatic bolt gun', 52, 40, 9, 72),
          (null, 'Ghost Dog', 'Pistol', 28, 20, 6.5, 35),
          ('Jason Bourne', null, 'Parkour', 27, 25, 7, 48),
          ('John Wick', 'Baba Yaga', 'Lots of guns', 35, 50, 9.5, 433),
          ('Jules Winnfield', null, 'pistol', 26, 15, 6.5, 13),
          ('Leon', 'The Professional', 'Everything', 41, 30, 8.5, 87),
          ('Nikita Mears', 'Nikita, La Femme Nikita', 'Silenced pistols', 28, 30, 7, 32),
          ('Pickle Rick', 'Solenya', 'Lasers and office supplies', 60, 0, 8, 24);

          -- created new table.
          create table Contracts(target_name text,target_location text, target_photo text, target_security numeric, client_name varchar(30), budget numeric, id serial);

          -- insert new values to table
          insert into contracts values ('Butch Coolidge', 'Los Angeles', 'https://goo.gl/LCquZj', 3, 'Marcellus Wallace', 40, 1),
            ('The Jaguar', 'Russian Embassy', 'https://goo.gl/6JWsiv', 9, 'Concerto', 70, 2),
            ('Norman Stansfield', 'Manhattan', 'https://i.imgur.com/mdIk33E.jpg', 7, 'Mathilda', 35),
            ('Santino DAntonio', 'Continental Hotel', 'https://goo.gl/fUPkYy', 10, 'Winston', 25),
            ('Sonny Valerio', 'Queens', 'https://goo.gl/8DHYUS', 4, 'Ray Vargo', 10);

-- 1. Select all the assassins, sorted by number of kills.
select * from assassins order by kills desc;

-- 2. Select all of the assassins older than 30 years old.
select * from assassins where age > 30;

-- 3. Select all the contracts that can afford to pay Nikita Mears. (Budget >= her price).
select * from contracts where budget >= 30;

-- 4. Count the number of assassins that are capable of taking out Norman Stansfield. (Their rating >= his security level)
select * from assassins where rating >= 7;

-- 5. Get the total amount it would require to hire every available assassin.
select sum(price) from assassins;

-- 6. Assign the following jobs to these assassins:
-- Jules Winnfield -> Butch Coolidge
-- The Jackal -> The Jaguar
-- John Wick -> The Jaguar
-- Leon -> Norman Stansfield
-- Pickle Rick -> Sonny Valerio
-- Jules Winnfield -> Santino D'Antonio
-- Nikita Mears -> Norman Stansfield
-- Ghost Dog -> Butch Coolidge

create table assassins_contracts(assassins_id integer references assassins (id), contracts_id integer references contracts (id));
  insert into assassins_contracts(assassins_id, contracts_id)
    values(6, 1),
          (1, 2),
          (5, 2),
          (7, 3),
          (9, 5),
          (6, 4),
          (8, 3),
          (3, 1);

select * from assassins inner join assassins_contracts on assassins.id=assassins_contracts.assassins_id inner join contracts on assassins_contracts.contracts_id=contracts.id;

select(assassins.full_name, contracts.client_name, contracts.target_name) from assassins inner join assassins_contracts on assassins.id=assassins_contracts.assassins.id;

 -- 7. Count the number of currently contracted assassins:
 select count(*) from assassins_contracts;

 --8. Find the lowest total cost to complete all assigned contracts.
 --have not finished this one and any number after...
