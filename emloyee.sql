


create database Employee_Database;

use Employee_Database;
create table dept(no varchar(20) primary key, dname varchar(20), dloc varchar(20));

create table employee(empno int,ename varchar(20),mgr_no int,hiredate varchar(20), sal float,
no varchar(20),primary key(empno,no), foreign key(no) references dept(no));

create table incentives(empno int, date VARCHAR(20), amt float,primary key(empno,date),foreign
key(empno) references employee(empno));

create table project(pno int primary key, ploc VARCHAR(20),pname varchar(20));

create table Assingnedto(empno int, pno int,job_role text, primary key(empno,pno), foreign key(empno)
references employee(empno), foreign key(pno) references project(pno));

insert into dept values(1,"cse","pj");
insert into dept values(2,"ise","pj");
insert into dept values(3,"csds","pg");
insert into dept values(4,"ece","pg");
insert into dept values(5,"aiml","pj");

insert into employee values(101,"mdr",100,"12/01/1999",100000,1);
insert into employee values(201,"sak",200,"17/01/2020",50000,2);
insert into employee values(301,"grp",100,"01/09/2004",30000,3);
insert into employee values(401,"sws",101,"03/08/2000",10000,4);
insert into employee values(501,"sks",101,"29/2/2008",90000,5);

insert into incentives values(101,"12/03/2004",50000);
insert into incentives values(201,"17/03/2024",25000);
insert into incentives values(301,"01/12/2019",15000);
insert into incentives values(401,"03/11/2019",5000);
insert into incentives values(501,"29/4/2019",45000);

insert into project values(10,"bng","chatbot");
insert into project values(40,"delhi","ml model");
insert into project values(50,"bombay","blockchain");
insert into project values(30,"chennai","stocks");
insert into project values(80,"mysore","android app");

insert into Assingnedto values(101,10,"devops");
insert into Assingnedto values(201,40,"sde");
insert into Assingnedto values(301,50,"manager");
insert into Assingnedto values(401,30,"jpa");
insert into Assingnedto values(501,80,"pa");

select * from dept;
select * from employee;
select * from incentives;
select * from Assingnedto;

SELECT DISTINCT employee.empno
FROM employee
JOIN Assingnedto ON employee.empno = Assingnedto.empno
JOIN project ON Assingnedto.pno = project.pno
WHERE project.ploc IN ('bng', 'mysore', 'hyderabad');

SELECT empno
FROM employee
WHERE empno NOT IN (SELECT empno FROM incentives);

SELECT e.ename AS Employee_Name,
       e.empno AS Employee_Number,
       d.dname AS Department,
       a.job_role AS Job_Role,
       d.dloc AS Department_Location,
       p.ploc AS Project_Location
FROM employee e
JOIN dept d ON e.no = d.no
JOIN Assingnedto a ON e.empno = a.empno
JOIN project p ON a.pno = p.pno
WHERE d.dloc = p.ploc;

