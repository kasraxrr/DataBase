create schema startcompany;
SET SCHEMA 'startcompany';

CREATE TABLE employee(
    firstname varchar(15),
    lastname varchar(15),
    department varchar(3),
    salary bigint,
    employid smallint
);
INSERT INTO employee (firstname, lastname, department, salary, employid)
Values ('Anders', 'Hansen', 'A1', 18900, 24);
INSERT INTO employee (firstname, lastname, department, salary, employid)
Values ('Victor', 'jensen', 'A2', 18900, 24);
INSERT INTO employee (firstname, lastname, department, salary, employid)
Values ('Devin', 'andersen', 'A3', 18900, 4);
INSERT INTO employee (firstname, lastname, department, salary, employid,startdate,age)
Values ('Tobias', 'Hansen', 'A4', 18900, 5,'2004-02-03',22);
INSERT INTO employee (firstname, lastname, department, salary, employid,startdate,age)
Values ('Hussain', 'gcv', 'A5', 18900, 7,'2004-02-03',44);
INSERT INTO employee (firstname, lastname, department, salary, employid,startdate,age)
Values ('Peter', 'sas', 'A6', 18900, 8,'2004-02-03',20);

SELECT  *
FROM employee;

DELETE FROM employee;

ALTER TABLE employee add startdate DATE;
ALTER TABLE employee add age SMALLINT;

UPDATE employee
SET startdate = '2007-04-16'
WHERE employee.firstname = 'Devin';

UPDATE employee
SET salary = salary*1.1
WHERE department = 'A1';

SELECT *
from employee
Where department='A1';


Where salary>19000;

SELECT *
from employee;


DELETE FROM employee
WHERE firstname='Hussain';

SELECT Sum(salary)
from employee;

DROP TABLE employee;

select *
from employee
where firstname like 'P%'



