create database megamart;
use megamart;
create table location(
 loc_id int unsigned auto_increment primary key,
 city varchar(30),
 state varchar(30));
select * from location;
 
create table branch(
 brn_id int unsigned auto_increment primary key,
 brn_name int,
 foreign key branch(loc_id) references location(loc_id));
select * from branch;

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
 
create table products(
 prod_id int unsigned auto_increment primary key,
 foreign key products(cat_id) references category(cat_id),
 prod_type varchar(30),
 prod_name varchar(30),
 p_unit_price double,
 supplier_cost double,
 foreign key products(brn_id) references branch(brn_id));
select * from products;
 
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
  
  
  
 
 

 
 
 
 
 

 
 
 
                      
                
