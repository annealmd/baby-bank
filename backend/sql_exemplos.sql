use baby_bank
insert into tb_user (name, surname, email, password, dtBirth) values ('Anne', 'Bright', 'anne@gmail.com', 'anne5', '1971-9-10')

insert into tb_income(amount, description,idUser, idOrigin) values (100.0, 'presente', '1', '1')

insert into tb_income(amount, description,idUser, idOrigin) values (100.0, '', '1', '2')

insert into tb_savings(amount, description,idUser) values (100.0, '', '1')

DELETE FROM `baby_bank`.`tb_expenses` WHERE (`id` = '1')

insert into tb_expenses(amount, description,idCategory, idUser) values (10.0, 'Lanche da tarde', '2', '1')

insert into tb_expenses(amount, description,idCategory, idUser) values (4.0, 'casa', '3', '1')

SELECT SUM(amount) total_expenses from tb_expenses

SELECT 
    e.idCategory AS 'Id', 
    c.name AS 'Tipo', 
    SUM(e.amount) AS 'Total' 
    FROM tb_expenses e 
    INNER JOIN tb_category c 
    on  e.idCategory = c.id 
    GROUP BY e.idCategory, u.id,

SELECT u.name, e.description, e.amount FROM tb_expenses e INNER JOIN tb_user u on  e.idUser = u.id

SELECT * FROM tb_expenses where dtCreated between '2023-01-07' and '2023-01-10'
SELECT * FROM tb_expenses where dtCreated > date_sub(now(), interval 1 week);
SELECT * FROM tb_expenses where dtCreated > date_sub(now(), interval 1 month)

-- Teste

USE baby_bank
SELECT * FROM tb_user
insert into tb_user (name, surname, email, password, dtBirth) values ('Anne', 'Bright', 'bright@gmail.com', 'anne5', '1971-9-10')
insert into tb_user (name, surname, email, password, dtBirth) values ('Robert', 'kalff', 'kalff@gmail.com', 'robert5', '1969-4-4')
insert into tb_user (name, surname, email, password, dtBirth) values ('Jaime', 'Mayor', 'mayor@gmail.com', 'jaime5', '1969-7-8')

insert into tb_origin(name, idUser) values ('Presente','1')
insert into tb_origin(name, idUser) values ('Mesada','1')
insert into tb_income(amount, description,idUser, idOrigin) values (4000.0, ' ', '1', '2')
insert into tb_category(name, idUser) values ('iFood', '1')
insert into tb_category(name, idUser) values ('Roupa', '1')
insert into tb_expenses(amount, description,idCategory, idUser) values (100.0, 'Lanche da tarde', '1', '1')
insert into tb_expenses(amount, description,idCategory, idUser) values (400.0, 'Formatura', '2', '1')

insert into tb_origin(name, idUser) values ('Presente','2')
insert into tb_origin(name, idUser) values ('Salário','2')
insert into tb_income(amount, description,idUser, idOrigin) values (4000.0, 'Ancle John ', '2', '1')
insert into tb_income(amount, description,idUser, idOrigin) values (6000.0, '', '2', '2')
insert into tb_category(name, idUser) values ('iFood', '2')
insert into tb_category(name, idUser) values ('Casa', '2')
insert into tb_category(name, idUser) values ('Bar', '2')
insert into tb_expenses(amount, description,idCategory, idUser) values (100.0, 'Jantar', '1', '2')
insert into tb_expenses(amount, description,idCategory, idUser) values (1400.0, 'Mesa da Sala', '2', '2')
insert into tb_expenses(amount, description,idCategory, idUser) values (500.0, 'Zenaides', '3', '2')

insert into tb_origin(name, idUser) values ('Presente','3')
insert into tb_origin(name, idUser) values ('Bônus','3')
insert into tb_income(amount, description,idUser, idOrigin) values (6000.0, 'Aunt Anne', '3', '1')
insert into tb_income(amount, description,idUser, idOrigin) values (14000.0, 'Company', '3', '2')
insert into tb_category(name, idUser) values ('iFood', '3')
insert into tb_category(name, idUser) values ('Casamento', '3')
insert into tb_category(name, idUser) values ('Noitada', '3')
insert into tb_expenses(amount, description,idCategory, idUser) values (500.0, 'Ceia', '1', '3')
insert into tb_expenses(amount, description,idCategory, idUser) values (1500.0, 'Presente', '2', '3')
insert into tb_expenses(amount, description,idCategory, idUser) values (1000.0, 'New York', '3', '3')

SELECT
e.idUser,
u.name,
SUM(e.amount) total_expenses 
from tb_expenses e
INNER JOIN tb_user u
ON u.id = e.idUser
GROUP BY e.idUser