drop table customer cascade constraints;
Create Table CUSTOMER
(
Cust_ID VARCHAR2(10) NOT NULL,
Fname   VARCHAR2(35),
Lname   VARCHAR2(35),
Address VARCHAR2(35),
Email VARCHAR2(35),
Vehicle VARCHAR2(35),
Phone NUMBER (10),
LoyaltyPoints NUMBER (10),
CONSTRAINT CUSTPK PRIMARY KEY(Cust_ID)  
);

drop table employee cascade constraints;
Create Table EMPLOYEE
(
Emp_ID VARCHAR2(10) NOT NULL,
Emp_Name VARCHAR2(35),
Address VARCHAR2(35),
Startdate DATE,
Salary NUMBER(10),
CONSTRAINT EMPPK PRIMARY KEY (Emp_ID)  
);


drop table salesperson cascade constraints;
Create Table SALESPERSON
(
SalesCount NUMBER(30),
Salesperson_ID VARCHAR2(10) unique,
CONSTRAINT SPFK FOREIGN KEY (Salesperson_ID) references EMPLOYEE(Emp_ID)
);

drop table mechanic;
Create Table MECHANIC 
(
HourlyPay NUMBER(30),
Mechanic_ID VARCHAR2(10) unique,
CONSTRAINT MEFK FOREIGN KEY (Mechanic_ID)references EMPLOYEE(Emp_ID)
);
alter table mechanic add constraint mechanic_ID unique (mechanic_ID);

drop table manager;
Create Table MANAGER
(
Experience NUMBER(30),
Manager_ID VARCHAR2(10) UNIQUE,
CONSTRAINT MAFK FOREIGN KEY (Manager_ID)references EMPLOYEE(Emp_ID)
);

drop table BRANCH;
Create Table BRANCH 
(
Branch_ID VARCHAR2(10) NOT NULL,
Br_Name VARCHAR2(35),
Incharge_ID VARCHAR2(10),
Address VARCHAR2(35),
City VARCHAR (50)NOT NULL,
CONSTRAINT BRANCHPK PRIMARY KEY (Branch_ID),
CONSTRAINT BRANCHFK FOREIGN key (Incharge_ID) references MANAGER(Manager_ID)
);

drop table model cascade constraints;
Create Table MODEL
(
Model_ID varchar2(10) NOT NULL,
Year VARCHAR2(10) NOT NULL,
Description VARCHAR2(30),
CONSTRAINT MODELPK PRIMARY KEY(Model_ID)
);

drop table manufacturer cascade constraints;
Create table Manufacturer
(
Mf_ID VARCHAR2(10), 
Mf_Name VARCHAR2(35) NOT NULL,
Email VARCHAR2(50),
Address VARCHAR2(35) DEFAULT 'NOT AVAILABLE',
CONSTRAINT MANPK PRIMARY KEY(Mf_ID)
);

drop table autoparts cascade CONSTRAINTS;
Create table AUTOPARTS
(
Part_ID VARCHAR2(10),
Mod_ID VARCHAR2(8), 
Part_Name VARCHAR2(35) NOT NULL,
Quantity NUMBER(30),
Category VARCHAR2(30),
Price NUMBER(30),
CONSTRAINT AUTOPK PRIMARY KEY(Part_ID),
CONSTRAINT AUTOFK FOREIGN KEY(Mod_ID) REFERENCES MODEL(Model_ID)
);

drop table services CASCADE CONSTRAINTS;
Create table SERVICES
(
Service_ID VARCHAR2(10),
Service_Name VARCHAR2(35) NOT NULL,
Cost NUMBER (30),
Description VARCHAR2(30),
CONSTRAINT SERVPK PRIMARY KEY(Service_ID)
);

drop table transaction cascade constraints;
Create table TRANSACTION
(
Trans_ID VARCHAR2(10),
DateofTrans Date NOT NULL,
Total Number (10,2),
Customer_ID VARCHAR(10),
Salesperson_ID VARCHAR2(10),
Part_ID VARCHAR2(10),
CONSTRAINT TRANSPK PRIMARY KEY (Trans_ID),
CONSTRAINT TRANSFK1 FOREIGN key (Customer_ID) references CUSTOMER(Cust_ID),
CONSTRAINT TRANSFK2 FOREIGN key (Salesperson_ID) references SALESPERSON(Salesperson_ID),
CONSTRAINT TRANSFK4 FOREIGN KEY (Part_ID) references AUTOPARTS(Part_ID)
);

drop table mechanic_services cascade constraints;
Create table mechanic_services
(
Mechanic_ID VARCHAR2(10),
Service_ID VARCHAR2(10),
CONSTRAINT MSFK1 FOREIGN key (Mechanic_ID) references MECHANIC(Mechanic_ID),
CONSTRAINT MSFK2 FOREIGN key (Service_ID) references SERVICES(Service_ID),
CONSTRAINT MSPK PRIMARY KEY(Mechanic_ID,Service_ID)
);

drop table autoparts_manufacturer cascade constraints;
Create table autoparts_manufacturer
(
Part_ID VARCHAR2(10),
Mf_ID VARCHAR2(10),
CONSTRAINT AMFK1 FOREIGN key (Part_ID) references AUTOPARTS(Part_ID),
CONSTRAINT AMFK2 FOREIGN key (Mf_ID) references MANUFACTURER(Mf_ID)
CONSTRAINT AMPK PRIMARY KEY(Part_ID,Mf_ID)
)

drop table customer_autoparts cascade constraints;
Create table customer_autoparts
(
Cust_ID VARCHAR2(10),
Part_ID VARCHAR2(10),
CONSTRAINT CAFK1 FOREIGN key (Cust_ID) references CUSTOMER(Cust_ID),
CONSTRAINT CAFK2 FOREIGN key (Part_ID) references AUTOPARTS(Part_ID)
CONSTRAINT CAPK PRIMARY KEY(Cust_ID,Part_ID)
)

desc customer;
select * from customer;
insert into customer values ('c1','john','cole','frankford','c1@gmail.com','Ford',8989898989,25);
insert into customer values ('c2','chris','davis','mccallum','c2@gmail.com','Mustang',8989898990,30);
insert into customer values ('c3','billy','chuck','palencia','c3@gmail.com','camaro',8989898991,35);
select * from customer;

desc employee;
select * from employee;
insert into employee values('e1','morrison','ashwood',TO_DATE('01-01-1998','MM-DD-YYYY'),'10000');
insert into employee values('e2','david','estates',TO_DATE('02-02-1999','MM-DD-YYYY'),'20000');
insert into employee values('e3','jennifer','campbell',TO_DATE('03-03-2000','MM-DD-YYYY'),'30000');
insert into employee values('e4','jenny','coit',TO_DATE('04-04-2001','MM-DD-YYYY'),'40000');
insert into employee values('e5','kathy','northplane',TO_DATE('05-05-2002','MM-DD-YYYY'),'50000');
insert into employee values('e6','christopher','plano',TO_DATE('06-06-2003','MM-DD-YYYY'),'55000');
insert into employee values('e7','krish','richardson',TO_DATE('07-07-2004','MM-DD-YYYY'),'60000');
insert into employee values('e8','daniel','frisco',TO_DATE('08-08-2005','MM-DD-YYYY'),'65000');
insert into employee values('e9','ethan','freshno',TO_DATE('09-09-2006','MM-DD-YYYY'),'70000');
select * from employee;

desc salesperson;
select * from salesperson;
insert into salesperson values(50,'e1');
insert into salesperson values(100,'e2');
insert into salesperson values(150,'e3');
select * from salesperson;

desc mechanic;
select * from mechanic;
insert into mechanic values(10,'e4');
insert into mechanic values(15,'e5');
insert into mechanic values(20,'e6');
select * from mechanic;

desc manager;
select * from manager;
insert into manager values(1,'e7');
insert into manager values(2,'e8');
insert into manager values(3,'e9');

desc branch;
select * from branch;
insert into branch values('b1','cloes','e8','inwood','dallas');
insert into branch values('b2','joes','e9','northwood','seattle');
insert into branch values('b3','harrys','e7','westwood','mckinney');
select * from branch;

desc model;
select * from model;
insert into model values('m1',2001,'sedan');
insert into model values('m2',2002,'hatchback');
insert into model values('m3',2005,'SUV');
select * from model;

desc manufacturer;
select * from manufacturer;
insert into manufacturer values('mf1','courtney','mf1@gmail.com','washington');
insert into manufacturer values('mf2','phoebe','mf2@gmail.com','houston');
insert into manufacturer values('mf3','martha','mf3@gmail.com','southlake');
select * from manufacturer;

desc autoparts;
select * from autoparts;
insert into autoparts values('p1','m2','gear','20','gearsystem','500');
insert into autoparts values('p2','m3','tyre','25','locomotion','1000');
insert into autoparts values('p3','m1','windshield','30','transparentscreens','1500');
select * from autoparts;

desc services;
select * from services;
insert into services values('s1','washing',1000,'deep cleanse');
insert into services values('s2','wiping',1200,'drying');
insert into services values('s3','oil change',1400,'lubrication');
select * from services;

desc transaction;
select * from transaction;
insert into transaction (trans_id,dateoftrans) values ('t1',TO_DATE('09-09-2006','MM-DD-YYYY'));
insert into transaction values('t1',TO_DATE('09-09-2006','MM-DD-YYYY'),2500,'c2','e2','p2');
insert into transaction values('t2',TO_DATE('09-09-2006','MM-DD-YYYY'),2700,'c3','e3','p3');
insert into transaction values('t3',TO_DATE('09-09-2006','MM-DD-YYYY'),2900,'c1','e1','p1');
select * from transaction;

desc mechanic_services;
select * from mechanic_services;
insert into mechanic_services values('e5','s2');
insert into mechanic_services values('e6','s3');
insert into mechanic_services values('e4','s1');
select * from mechanic_services;

desc autoparts_manufacturer;
select * from autoparts_manufacturer;
insert into autoparts_manufacturer values('p2','mf2');
insert into autoparts_manufacturer values('p3','mf3');
insert into autoparts_manufacturer values('p1','mf1');
select * from autoparts_manufacturer;

desc customer_autoparts;
select * from customer_autoparts;
insert into customer_autoparts values('c2','p2');
insert into customer_autoparts values('c3','p3');
insert into customer_autoparts values('c1','p1');
select * from customer_autoparts;