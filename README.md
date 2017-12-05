# Killbase

Killbase is a job board for international assassins. Assassins and their clients can register with Killbase, and enter or sign up for jobs. Assassins can have zero or more code names, and can sign up for any number of contracts; a contract may also be open to any number of assassins.

Assassins have:
  * a full fame
  * zero or more codenames
  * a weapon of choice
  * contact information
  * a minimum price they charge
  * a float rating from 1-10
  * number of kills
  * an age

Contracts have:
  * a target
  * a client
  * a budget (maximum price for the job)
  * whether it's completed or not
  * who completed it, if completed

Clients have:
  * a name

Targets have:
  * a name
  * a location
  * a photo
  * a security level

## Your tasks:

1) Create an entity relationship diagram for the tables in the Killbase database.
2) Create the killbase database, and write the SQL to create all the tables.
3) Write the SQL to seed the database with the following information:

### Assassins

| Full name        | Code Names              | Weapon                     | Age | Price | Rating | Kills |
|------------------|-------------------------|----------------------------|-----|-------|--------|-------|
| Alexander Duggan | The Jackal              | Sniper rifle               | 31  | 45    | 7.5    | 28    |
| Anton Chigurh    | Old Man                 | Pneumatic bolt gun         | 52  | 40    | 9      | 72    |
|                  | Ghost Dog               | Pistol                     | 28  | 20    | 6.5    | 35    |
| Jason Bourne     |                         | Parkour                    | 27  | 25    | 7      | 48    |
| John Wick        | Baba Yaga               | Lots of guns               | 35  | 50    | 9.5    | 483   |
| Jules Winnfield  |                         | Pistol                     | 26  | 15    | 6.5    | 13    |
| Leon             | The Professional        | Everything                 | 41  | 30    | 8.5    | 87    |
| Nikita Mears     | Nikita, La Femme Nikita | Silenced pistols           | 28  | 30    | 7      | 32    |
| Pickle Rick      | Solenya                 | Lasers and office supplies | 60  | 0     | 8      | 24    |

## Contracts

| Target Name       | Target Location   | Target Photo                    | Target Security | Client Name       | Budget |
|-------------------|-------------------|---------------------------------|-----------------|-------------------|--------|
| Butch Coolidge    | Los Angeles       | https://goo.gl/LCquZj           | 3               | Marcellus Wallace | 40     |
| The Jaguar        | Russian Embassy   | https://goo.gl/6JWsiv           | 9               | Concerto          | 70     |
| Norman Stansfield | Manhattan         | https://i.imgur.com/mdIk33E.jpg | 7               | Mathilda          | 35     |
| Santino D'Antonio | Continental Hotel | https://goo.gl/fUPkYy           | 10              | Winston           | 25     |
| Sonny Valerio     | Queens            | https://goo.gl/8DHYUS           | 4               | Ray Vargo         | 10     |


```
     +------------------------------------+
     |            ASSASSINS               |
     +----------+-------------------------+         +---------------------------------+
     | id       | serial primary key      |         |              CODENAMES          |
     | fullname | text                    |        /+------------+--------------------+
     | codename | foreign key (codenames) +---------+ assassinid | serial primary key |
    /| weapon   | text                    |        \| codename   | text               |
+----+ contact  | text                    |         +------------+--------------------+
|   \| price    | integer                 |
|    | rating   | float                   |
|    | kills    | integer                 |
|    | age      | integer                 |         +---------------------------+
|    +----------+-------------------------+         |        CLIENTS            |
|                                                   +------+--------------------+
|                                                   | id   | serial primary key +----------------+
|                                                   | name | text               |                |
|        +-------------------------------+          +------+--------------------+                |
|        |            TARGETS            |                                                       |
|        +----------+--------------------+                                                       |
|        | id       | serial primary key +----+     +---------------------------------------+    |
|        | name     | text               |    |     |               CONTRACTS               |    |
|        | location | text               |    |     +-------------+-------------------------+    |
|        | photo    | text               |    |     | id          | serial primary key      |    |
|        | seclevel | integer            |    +-----+ targetid    | foreign key (targets)   |\   |
|        +----------+--------------------+          | clientid    | foreign key (clients)   +----+
|                                                   | budget      | integer                 |/
|                                                  /| completed   | boolean                 |
+---------------------------------------------------+ completedby | foreign key (assassins) |
                                                   \+-------------+-------------------------+
```                                                   
