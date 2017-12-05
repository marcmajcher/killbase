=Killbase=

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
|        | seclevel | integer            |    +-----+ targetid    | foreign key (targets)   |    |
|        +----------+--------------------+          | clientid    | foreign key (clients)   +----+
|                                                   | budget      | integer                 |
|                                                  /| completed   | boolean                 |
+---------------------------------------------------+ completedby | foreign key (assassins) |
                                                   \+-------------+-------------------------+
```                                                   
