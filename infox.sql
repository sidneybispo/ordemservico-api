-- comentários
-- a linha abaixo cria um banco de dados
create database dbinfox;
-- a linha abaixo escolhe o banco de dados
use dbinfox;
-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key, 
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- o comando abaixo descreve a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- create -> equivale  ao insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1, 'José de Assis', '9999-9999', 'joseassis', '123456');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2, 'Bill Gates', '9999-9999', 'bill', '123456');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3, 'Administrador', '9999-9999', 'admin', 'admin');
-- a linha abaixo exibe os dados da tabela (CRUD)
-- read -> equivale ao select
select * from tbusuarios;

-- a linha abaixo modifica dados na tabela (CRUD)
-- update -> update

update tbusuarios set fone='8888-8888' where iduser=2;

-- a linha abaixo apaga um registro da tabela (CRUD)
-- delete -> delete
delete from tbusuarios where iduser=3;

select * from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('Linus Torvalds', 'Rua Tux,2015', '9999-9999', 'linus@linus.com');

select * from tbclientes;

use dbinfox;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico Varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos (equipamento, defeito, servico, tecnico, valor, idcli)
values ('Notebook', 'Não liga', 'Troca da fonte', 'Zé', 87.50, 1);

select * from tbos;

-- o código abaixo traz informações de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);





