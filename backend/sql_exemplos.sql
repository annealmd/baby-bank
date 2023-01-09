use baby_bank
insert into tb_user (name, surname, email, password) values ('Maria', 'Almeida', 'maria@gmail.com', 'maria5')

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
