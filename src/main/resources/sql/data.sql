---------------------------------------  
insert into Accounts (USER_NAME, ACTIVE, ENCRYTED_PASSWORD, USER_ROLE)
values ('employee1', 1,
'$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 'ROLE_EMPLOYEE');

insert into Accounts (USER_NAME, ACTIVE, ENCRYTED_PASSWORD, USER_ROLE)
values ('manager1', 1,
'$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 'ROLE_MANAGER');

----------------
insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S001', 't-shirt', 100, NOW());

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S002', 'jacket', 50, NOW());

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S003', 'sweater', 120, NOW());

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S004', 'jeans', 120, NOW());

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S005', 'dress', 110, NOW());