create database megamart;
use megamart;
create table location(
 loc_id int unsigned auto_increment primary key,
 city varchar(30),
 state varchar(30));
select * from location;
insert into Location (loc_id,City,State)
values (51,'Kolkata','West Bengal'),
(52,'Bangalore','Karnataka'),
(53,'Hydrabad','Telangana'),
(54,'New Delhi','Delhi'),
(55,'Gurgaon','Haryana'),
(56,'Channei','TamilNadu');
 
create table branch(
 brn_id int unsigned auto_increment primary key,
 brn_name int,
 foreign key branch(loc_id) references location(loc_id));
select * from branch;
insert into Branch (Brn_id,Loc_id,Brn_name)
values (101,51,'Esplanade'),
(102,55,'Dhundhera'),
(103,55,'Huda City Center'),
(104,54,'Sarojini Nagar');

create table supplier(
 sup_id int unsigned auto_increment primary key,
 f_name varchar(30),
 l_name varchar(30),
 Email varchar(50),
 Ph_no int,
 foreign key supplier(loc_id) references location(loc_id),
 street varchar(30));
select * from supplier;
 
create table category(
 cat_id int unsigned auto_increment primary key,
 cat_name varchar(30),
 sub_category varchar(30));
select * from category;
Insert into Category values
(1001,'Grocery','Vegetables','Frozen food','Bakery'),
(1002,'Electronics','Home appliance','Computer & accessories','Mobile & audio'),
(1003,'Garments','Mens','Womens','Kids');
 
create table products(
 prod_id int unsigned auto_increment primary key,
 foreign key products(cat_id) references category(cat_id),
 prod_type varchar(30),
 prod_name varchar(30),
 p_unit_price double,
 supplier_cost double,
 foreign key products(brn_id) references branch(brn_id));
select * from products;
insert into Product values
(1111,1001,102,'Vegetables','Sweet Potato',4.00,2.50),
(1112,1001,102,'Frozen Food','Fish Finger',40.00,25.00),
(1113,1001,102,'Bakery','Chapati',80.00,50.00),
(1114,1002,102,'Home appliance','Smart TV',24000.00,16000.00),
(1115,1002,102,'Computer & accessories','Lenovo L14 Laptop',95000.00,70000.00),
(1116,1002,102,'Mobile & Audio','Samsung Bluetooth headset',4000.00,2500.00),
(1117,1003,102,'Denim','Stone wash',2500.00,1000.00),
(1118,1003,102,'Top','Tank Top',450.00,200.00),
(1119,1003,102,'Kids clothing','Pants',400.00,250.00);
 
create table order_to_supplier(
 ord_id int unsigned auto_increment primary key,
 foreign key order_to_supplier(prod_id) references products(prod_id),
 foreign key order_to_supplier(sup_id) references supplier(sup_id),
 quantity int,
 weight varchar(30),
 height varchar(30));
select * from order_to_supplier;
 
create table supplied_product(
SupProdct_id int unsigned auto_increment primary key,
foreign key supplied_product(ord_id) references order_to_supplier(ord_id),
SupProdct_name varchar(30),
SupProd_unitCost double,
quantity int,
dat_id int,
loc_id int);
select * from supplied_product;

create table date(
 dat_id int unsigned auto_increment primary key,
 delivery_dt int,
 receive_dt int);
select * from date;
 insert into Date values
    (201,'2022-02-11 13:23:44','2022-02-12 15:23:44'),
    (202,'2022-02-12 14:23:44','2022-02-13 16:23:44'),
    (203,'2022-02-13 13:53:44','2022-02-14 14:23:44'),
    (204,'2022-02-14 12:23:44','2022-02-15 13:23:44');
 
create table time(
 tim_id int unsigned auto_increment primary key,
 full_date date);
select * from time;

create table purchase(
 pur_id int unsigned auto_increment primary key,
 foreign key purchase(prod_id) references products(prod_id),
 foreign key purchase(ord_id) references order_to_supplier(ord_id),
 foreign key purchase(sup_id) references supplier(sup_id),
 foreign key purchase(dat_id) references date(dat_id),
 foreign key purchase(tim_id) references time(tim_id),
 quantity int,
 pur_amount double);
select * from purchase;
 
create table inventory(
 inv_id int unsigned auto_increment primary key,
 foreign key inventory(sup_id) references supplier(sup_id),
 foreign key inventory(SupProdct_id) references supplied_product(SupProdct_id),
 SupProd_UnitCost double,
 Recv_qty_in_stock int,
 qty_out_of_stock int,
 stock_location varchar(30),
 category varchar(30),
 descrip varchar(105));
select * from inventory;

create table inventory_details(
 inv_detail_id int unsigned auto_increment primary key,
 foreign key inventory_details(prod_id) references products(prod_id),
 foreign key inventory_details(emp_id) references employee(emp_id),
 date_id int,
 quantity int,
 inv_id int);
select * from inventory_details;

 create table customer(
 cus_id int unsigned auto_increment primary key,
 f_name varchar(30),
 l_name varchar(30),
 email  varchar(30),
 Ph_no int,
 street varchar(30),
 foreign key customer(loc_id) references location(loc_id));
select * from customer;
 
create table billing(
 billing_id int unsigned auto_increment primary key,
 foreign key billing(loc_id) references location(loc_id),
 foreign key billing(cus_id) references customer(cus_id),
 foreign key billing(prod_id) references products(prod_id),
 foreign key billing(tim_id) references time(tim_id),
 foreign key billing(dat_id) references date(dat_id),
 quantity int,
 billing_amount double,
 foreign key billing(emp_id) references employee(emp_id),
 foreign key billing(brn_id) references branch(brn_id));
select * from billing;

 create table department(
  dep_id int unsigned auto_increment primary key,
  foreign key department(brn_id) references branch(brn_id),
  dep_name varchar(30),
  sub_dep  varchar(30));
select * from department;
insert into Department values
(501,102,'Store Manager',''),
(502,102,'Admin','Inventory collector'),
(503,102,'Floor Manager','Team Leader'),
(504,102,'IT','Technician'),
(505,102,'Cashier','Helper'),
(506,102,'Garments',''),
(507,102,'Electronics',''),
(508,102,'Grocery',''),
(509,101,'Store Manager',''),
(510,101,'Admin','Inventory collector'),
(511,101,'Floor Manager','Team Leader'),
(512,101,'IT','Technician'),
(513,101,'Cashier','Helper'),
(514,101,'Garments',''),
(515,101,'Electronics',''),
(516,101,'Grocery',''),
(517,103,'Store Manager',''),
(518,103,'Admin','Inventory collector'),
(519,103,'Floor Manager','Team Leader'),
(520,103,'IT','Technician'),
(521,103,'Cashier','Helper'),
(522,103,'Garments',''),
(523,103,'Electronics',''),
(524,103,'Grocery',''),
(525,104,'Store Manager',''),
(526,104,'Admin','Inventory collector'),
(527,104,'Floor Manager','Team Leader'),
(528,104,'IT','Technician'),
(529,104,'Cashier','Helper'),
(530,104,'Garments',''),
(531,104,'Electronics',''),
(532,104,'Grocery','');
  
  create table employee(
  emp_id int unsigned auto_increment primary key,
  foreign key employee(brn_id) references branch(brn_id),
  foreign key employee(dep_id) references department(dep_id),
  f_name varchar(30),
  l_name varchar(30),
  email varchar(30),
  Ph_no int,
  street varchar(30),
  foreign key employee(loc_id) references location(loc_id));
select * from employee;
insert into Employee values
(1,501,102,51,'Tapi','Dutta','tapi@mega.com','+91 8234529374','cyber city'),
(2,502,102,51,'Tom','Holand','tom@mega.com','+91 9234729974','sector 20 lane'),
(3,503,102,51,'Raj','Dutta','raj@mega.com','+91 9534529374','cyber city'),
(4,504,102,51,'Sarah','Khan','sarah@mega.com','+91 7234579377','cyber city'),
(5,505,102,51,'Jack','Santi','sonal@mega.com','+91 9934889374','cyber city'),
(6,506,102,51,'Lopi','Billings','lopi@mega.com','+91 8234669374','cyber city'),
(7,507,102,51,'Subrata','Yadav','subrata@mega.com','+91 6234729874','sector 20 lane'),
(8,508,102,51,'Amit','Yadav','amit@mega.com','+91 8534529555','cyber city');

create table Salary (
Emp_id int,
Dep_id int,
Brn_id int,
amount double,
FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_id),
FOREIGN KEY (Dep_id) REFERENCES Department(Dep_id),
FOREIGN KEY (Brn_id) REFERENCES Branch(Brn_id)
);
insert into Salary values
(1,501,102,100000.00),
(2,502,102,80000.00),
(3,503,102,70000.00),
(4,504,102,60000.00),
(5,505,102,50000.00),
(6,506,102,40000.00),
(7,507,102,30000.00),
(8,508,102,20000.00);


  
  
  
 
 

 
 
 
 
 

 
 
 
                      
                
