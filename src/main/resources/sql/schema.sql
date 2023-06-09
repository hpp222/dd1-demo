-- Create table
create table ACCOUNTS
(
  USER_NAME VARCHAR(20) not null,
  ACTIVE    BIT not null,
  ENCRYTED_PASSWORD  VARCHAR(128) not null,
  USER_ROLE VARCHAR(20) not null
) ;

alter table ACCOUNTS
  add primary key (USER_NAME) ;
---------------------------------------

create table PRODUCTS
(
  CODE        VARCHAR(20) not null,
  IMAGE       longblob,
  NAME        VARCHAR(255) not null,
  PRICE       double precision not null,
  CREATE_DATE datetime not null
) ;

alter table PRODUCTS
  add primary key (CODE) ;
---------------------------------------
-- Create table
create table ORDERS
(
  ID               VARCHAR(50) not null,
  AMOUNT           double precision not null,
  CUSTOMER_ADDRESS VARCHAR(255) not null,
  CUSTOMER_EMAIL   VARCHAR(128) not null,
  CUSTOMER_NAME    VARCHAR(255) not null,
  CUSTOMER_PHONE   VARCHAR(128) not null,
  ORDER_DATE       datetime not null,
  ORDER_NUM        INTEGER not null
) ;
alter table ORDERS
  add primary key (ID) ;
alter table ORDERS
  add constraint ORDER_UK unique (ORDER_NUM) ;
---------------------------------------

-- Create table
create table ORDER_DETAILS
(
  ID         VARCHAR(50) not null,
  AMOUNT     double precision not null,
  PRICE      double precision not null,
  QUANITY    INTEGER not null,
  ORDER_ID   VARCHAR(50) not null,
  PRODUCT_ID VARCHAR(20) not null
) ;
--  
alter table ORDER_DETAILS
  add primary key (ID) ;
alter table ORDER_DETAILS
  add constraint ORDER_DETAIL_ORD_FK foreign key (ORDER_ID)
  references ORDERS (ID);
alter table ORDER_DETAILS
  add constraint ORDER_DETAIL_PROD_FK foreign key (PRODUCT_ID)
  references PRODUCTS (CODE);