/*
    1378. Replace Employee ID With The Unique Identifier

    Schema:
    Create table If Not Exists Employees (id int, name varchar(20))
    Create table If Not Exists EmployeeUNI (id int, unique_id int)
    Truncate table Employees
    insert into Employees (id, name) values ('1', 'Alice')
    insert into Employees (id, name) values ('7', 'Bob')
    insert into Employees (id, name) values ('11', 'Meir')
    insert into Employees (id, name) values ('90', 'Winston')
    insert into Employees (id, name) values ('3', 'Jonathan')
    Truncate table EmployeeUNI
    insert into EmployeeUNI (id, unique_id) values ('3', '1')
    insert into EmployeeUNI (id, unique_id) values ('11', '2')
    insert into EmployeeUNI (id, unique_id) values ('90', '3')

    Description:

    Table: Employees

    +---------------+---------+
    | Column Name   | Type    |
    +---------------+---------+
    | id            | int     |
    | name          | varchar |
    +---------------+---------+
    id is the primary key (column with unique values) for this table.
    Each row of this table contains the id and the name of an employee in a company.
    

    Table: EmployeeUNI

    +---------------+---------+
    | Column Name   | Type    |
    +---------------+---------+
    | id            | int     |
    | unique_id     | int     |
    +---------------+---------+
    (id, unique_id) is the primary key (combination of columns with unique values) for this table.
    Each row of this table contains the id and the corresponding unique id of an employee in the company.
    

    Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

    Return the result table in any order.

    The result format is in the following example.

    

    Example 1:

    Input: 
    Employees table:
    +----+----------+
    | id | name     |
    +----+----------+
    | 1  | Alice    |
    | 7  | Bob      |
    | 11 | Meir     |
    | 90 | Winston  |
    | 3  | Jonathan |
    +----+----------+
    EmployeeUNI table:
    +----+-----------+
    | id | unique_id |
    +----+-----------+
    | 3  | 1         |
    | 11 | 2         |
    | 90 | 3         |
    +----+-----------+
    Output: 
    +-----------+----------+
    | unique_id | name     |
    +-----------+----------+
    | null      | Alice    |
    | null      | Bob      |
    | 2         | Meir     |
    | 3         | Winston  |
    | 1         | Jonathan |
    +-----------+----------+
    Explanation: 
    Alice and Bob do not have a unique ID, We will show null instead.
    The unique ID of Meir is 2.
    The unique ID of Winston is 3.
    The unique ID of Jonathan is 1.
*/

--- Solution: using left join
SELECT euni.unique_id, e.name FROM Employees e LEFT JOIN EmployeeUNI  euni ON euni.id = e.id;
