create database db_Cds;
use db_Cds;

drop database db_Cds;

create table tbArtistas (
	idArtista int auto_increment not null,
    NomeArtista varchar(100) not null,
    constraint pkArtista primary key (idArtista)
);

select * from tbArtistas;

insert into tbArtistas values(null, 'Ketelyn Sousa');
insert into tbArtistas values(null, 'Matheus Júnior');
insert into tbArtistas values(null, 'Kevelin Sousa');
insert into tbArtistas values(null, 'Bruno');
insert into tbArtistas values(null, 'Neds');


create table tbGravadora (
	idGravadora int auto_increment not null,
    NomeGravadora varchar(50) not null,
    constraint pkGravadora primary key (idGravadora)
);

select * from tbGravadora;

insert into tbGravadora values(null, 'PkDutra');
insert into tbGravadora values(null, 'GotosGrav');
insert into tbGravadora values(null, 'Dantas');
insert into tbGravadora values(null, 'Central');
insert into tbGravadora values(null, 'Tigres');


create table tbCategoria (
	idCategoria int auto_increment not null,
    NomeCategoria varchar(50) not null,
    constraint pkCategoria primary key (idCategoria)
);

select * from tbCategoria;

insert into tbCategoria values(null, 'Rock' );
insert into tbCategoria values(null, 'Pop' );
insert into tbCategoria values(null, 'Classicas' );
insert into tbCategoria values(null, 'Forro' );
insert into tbCategoria values(null, 'Sertanejo' );


create table tbEstado (
	idSiglaEstado char(2) not null,
    NomeEstado varchar(50) not null,
    constraint pkEstado primary key (idSiglaEstado)
);

select * from tbEstado;

insert into tbEstado values('sp', 'São Paulo');
insert into tbEstado values('rj', 'Rio de Janeiro');
insert into tbEstado values('ma', 'maranhão');
insert into tbEstado values('ac', 'acre');
insert into tbEstado values('al', 'alagoas');


create table tbCidade (
	idCidade int auto_increment not null,
    idSiglaEstado char(2) not null,
    NomeCidade varchar(100) not null,
    constraint pkCidade primary key (idCidade),
    constraint fkCidadeEstado foreign key (idSiglaEstado)
		references tbEstado (idSiglaEstado)
);

select * from tbCidade;

insert into tbCidade values(null, 'sp', 'Mauá');
insert into tbCidade values(null, 'rj',  'Rio de Janeiro');
insert into tbCidade values(null, 'ma', 'Presidente Dutra');
insert into tbCidade values(null, 'ac', 'rio branco');
insert into tbCidade values(null, 'al', 'maceió');


create table tbCliente (
	idCliente int auto_increment not null,
    idCidade int not null,
    NomeCliente varchar(100) not null,
    EnderecoCliente varchar(200) not null,
    RendaCliente decimal(10, 2) not null default 0.00,
    SexoCliente enum('f', 'm') not null default 'f',
    constraint pkCliente primary key (idCliente),
    constraint fkClienteCidade foreign key (idCidade)
		references tbCidade (idCidade)
);

select * from tbCliente;

insert into tbCliente values(null, 1, 'Pedro', 'Rua 01', 1900.00, 'm');
insert into tbCliente values(null, 2, 'Katerine', 'Rua 02', 200.00, default);
insert into tbCliente values(null, 3, 'Lara', 'Rua 03', 19.00, default);
insert into tbCliente values(null, 4, 'Joana', 'Rua 04', 20.00, default);
insert into tbCliente values(null, 5, 'Vinicius', 'Rua 05', 189.00, 'm');


create table tbConjuge (
	idConjuge int auto_increment not null,
    idCliente int not null,
    NomeConjuge varchar(100) not null,
    RendaConjuge decimal(10, 2) not null default 0.00,
    SexoConjuge enum('f', 'm') not null default 'm',
    constraint pkConjuge primary key (idConjuge),
    constraint fkConjugeCliente foreign key (idCliente)
		references tbCliente (idCliente)
);

select * from tbConjuge;

insert into tbConjuge values(null, 1, 'Luana', 10.00, 'f');
insert into tbConjuge values(null, 2, 'Leo', 190.00, default);
insert into tbConjuge values(null, 3, 'Marcos', 2150.00, default);
insert into tbConjuge values(null, 4, 'Matheus Júnior', 2150.00, default);
insert into tbConjuge values(null, 5, 'Liz', 50.00, 'f');


create table tbFuncionario (
	idFuncionario int auto_increment not null,
    NomeFuncionario varchar(100) not null,
    EnderecoFuncionario varchar(200) not null,
    SalarioFuncionario decimal(10, 2) not null default 0.00,
    SexoFuncionario enum('f', 'm') not null default 'm',
    constraint pkFuncionario primary key (idFuncionario)
);

select * from tbFuncionario;

insert into tbFuncionario values(null, 'Fernando', 'Rua 06', 1580.00, default);
insert into tbFuncionario values(null, 'Amanda', 'Rua 07', 1880.00, 'f');
insert into tbFuncionario values(null, 'Laura ', 'Rua 08', 2280.00, 'f');
insert into tbFuncionario values(null, 'João', 'Rua 09', 1380.00, default);
insert into tbFuncionario values(null, 'Paula Brito', 'Rua 10', 1780.00, 'f');


create table tbDependente (
	idDependente int auto_increment not null,
    idFuncionario int not null,
    NomeDependente varchar(100) not null,
    SexoDependente enum('f', 'm') not null default 'm',
    constraint pkDependente primary key (idDependente),
    constraint fkDependenteFuncionario foreign key (idFuncionario)
		references tbFuncionario (idFuncionario)
);

select * from tbDependente;

insert into tbDependente values(null, 1, 'Rafa', default);
insert into tbDependente values(null, 2, 'Maria', 'f');
insert into tbDependente values(null, 3, 'Pietra', 'f');
insert into tbDependente values(null, 4, 'Victor', default);
insert into tbDependente values(null, 5, 'Bruna', 'f');


create table tbTitulo (
	idTitulo int auto_increment not null,
    idCategoria int not null,
    idGravadora int not null,
    NomeCD varchar(100) not null,
    ValorCD decimal(10, 2) not null default 1.00,
    QuantidadeEstoque int not null default 0,
    constraint pkTitulo primary key (idTitulo),
    constraint fkTituloCategoria foreign key (idCategoria)
		references tbCategoria (idCategoria),
	constraint fkTituloGravadora foreign key (idGravadora)
		references tbGravadora (idGravadora)
);

select * from tbTitulo;

insert into tbTitulo values(null, 1, 1, 'Disco 01', 275.50, 750);
insert into tbTitulo values(null, 2, 2, 'Disco 02', 160.50, 301);
insert into tbTitulo values(null, 3, 3, 'Disco 03', 400.50, 188);
insert into tbTitulo values(null, 4, 4, 'Disco 04', 90.50, 28);
insert into tbTitulo values(null, 5, 5, 'Disco 05', 308.50, 158);

create table tbPedido (
	idNumeroPedido int auto_increment not null,
    idCliente int not null,
    DataPedido datetime not null,
    ValorPedido decimal(10, 2) not null default 0.00,
    constraint pkPedido primary key (idNumeroPedido),
    constraint fkPedidoCliente foreign key (idCliente)
		references tbCliente (idCliente)
);

select * from tbPedido;

insert into tbPedido values(null, 1, '2003-06-13', 475.50);
insert into tbPedido values(null, 2, '2018-08-11', 500.50);
insert into tbPedido values(null, 3, '2002-06-15', 20.50);
insert into tbPedido values(null, 4, current_date(), 195.50);
insert into tbPedido values(null, 5, '2003-05-16', 388.50);


create table tbPedido_Titulo (
	idNumeroPedido int not null,
    idTitulo int not null,
    QuantidadeCds int not null default 1,
    ValorCds decimal(10, 2) not null default 1.00,
    constraint pkPedido_Titulo primary key (idNumeroPedido, idTitulo),
    constraint fkPedido_Titulo_Titulo foreign key (idTitulo)
		references tbTitulo (idTitulo),
	constraint fkPedido_Titulo_Pedido foreign key (idNumeroPedido)
		references tbPedido (idNumeroPedido)
);

select * from tbPedido_Titulo;

insert into tbPedido_Titulo values(1, 1, 85, 75.00);
insert into tbPedido_Titulo values(2, 2, 100, 50.00);
insert into tbPedido_Titulo values(3, 3, 40, 79.00);
insert into tbPedido_Titulo values(4, 4, 75, 365.00);
insert into tbPedido_Titulo values(5, 5, 36, 105.00);


create table tbTitulo_Artista (
	idTitulo int not null,
    idArtista int not null,
    constraint pkTitulo_Artista primary key (idTitulo, idArtista),
    constraint fkTitulo_Artista_Titulo foreign key (idTitulo)
		references tbTitulo (idTitulo),
	constraint fkTitulo_Artista_Artista foreign key (idArtista)
		references tbArtistas (idArtista)
);

select * from tbTitulo_Artista;

insert into tbTitulo_Artista values(1, 1);
insert into tbTitulo_Artista values(2, 2);
insert into tbTitulo_Artista values(3, 3);
insert into tbTitulo_Artista values(4, 4);
insert into tbTitulo_Artista values(5, 5);


/*Exercícios de joins*/

/*Atividae 01*/

select tbCategoria.NomeCategoria, tbTitulo.NomeCD
from tbCategoria
join tbTitulo on tbCategoria.idCategoria = tbTitulo.idTitulo;

select c.NomeCategoria, cd.NomeCD
from tbCategoria as c
join tbTitulo as cd on c.idCategoria = cd.idTitulo;

select c.NomeCategoria, cd.NomeCD
from tbCategoria as c, tbTitulo as cd 
where c.idCategoria = cd.idTitulo;

/*Atividade 02*/

select p.idNumeroPedido, n.NomeCliente 
from tbPedido as p, tbCliente as n
where  p.idNumeroPedido = n.idCliente;

/*Ativ 03*/

select n.NomeFuncionario, d.NomeDependente
from tbFuncionario as n, tbDependente as d
where n.idFuncionario = d.idDependente;

/*Ativ 04*/
select n.NomeFuncionario, v.ValorPedido, t.idTitulo
from ((tbFuncionario as n
join tbPedido as v on n.idFuncionario = v.idNumeroPedido)
join tbTitulo as t on n.idFuncionario = t.idTitulo);

/*Atv05 */
select n.NomeCliente, c.NomeCidade
from tbCliente as n, tbCidade as c
where n.idCliente = c.idCidade and n.SexoCliente = 'f';
 
/*Atv06 */
select n.NomeCD, g.NomeGravadora 
from tbTitulo as n, tbGravadora as g
where n.idTitulo = g.idGravadora and g.NomeGravadora like 't%' or g.NomeGravadora like 'r%';

/*Ativ07*/
select n.NomeGravadora, c.NomeCD, c.ValorCD, c.QuantidadeEstoque
from tbGravadora as n, tbTitulo as c
where n.idGravadora = c.idTitulo and c.QuantidadeEstoque < 500;

/*Ativ08*/

select n.NomeCliente, v.ValorPedido
from tbCliente as n, tbPedido as v
where n.idCliente = v.idNumeroPedido and n.SexoCliente = 'f' and v.DataPedido >= '2002-06-01' and v.DataPedido <= '2002-06-30';

/*Ativ09*/
select n.idNumeroPedido, n.ValorPedido, n.DataPedido, f.NomeFuncionario
from tbPedido as n, tbFuncionario as f
where n.idNumeroPedido = f.idFuncionario and n.DataPedido >= '2003-01-01'  and n.DataPedido <= '2003-12-31' and f.NomeFuncionario like 'paula%';

/*Ativ10*/
select n.idNumeroPedido, c.NomeCliente, max(n.ValorPedido)
from tbPedido as n, tbCliente as c
where n.idNumeroPedido = c.idCliente;


/*Ativ 11*/

select distinct n.NomeArtista, c.NomeCategoria
from tbArtistas as n, tbCategoria as c
where n.idArtista = c.idCategoria;  

/*Ativ12*/
select n.idCliente, f.idFuncionario
from tbCliente as n, tbFuncionario as f
where n.idCliente = f.idFuncionario;  

select n.NomeCliente, f.NomeFuncionario
from tbCliente as n, tbFuncionario as f
where n.idCliente = f.idFuncionario;  


/*Ativ*/
select n.NomeCliente, c.NomeCD
from tbCliente as n, tbTitulo as c
where n.idCliente = c.idTitulo;


/*Ativ14*/

select c.NomeCD, n.NomeGravadora, t.NomeCategoria
from ((tbTitulo as c 
join tbGravadora as n on c.idTitulo = n.idGravadora)
join tbCategoria as t on c.idTitulo = t.idCategoria);

/*Ativ15*/

select n.NomeFuncionario, d.NomeDependente, c.NomeCliente, j.NomeConjuge
from (((tbFuncionario as n 
join tbDependente as d on n.idFuncionario = d.idDependente)
join tbCliente as c on n.idFuncionario = c.idCliente)
join tbConjuge as j on n.idFuncionario = j.idConjuge);

/*Ativ16*/
select n.NomeCliente, f.NomeFuncionario, c.NomeCD, ct.NomeCategoria, g.NomeGravadora
from ((((tbCliente as n
join tbFuncionario as f on n.idCliente = f.idFuncionario)
join tbTitulo as c on n.idCliente = c.idTitulo)
join tbCategoria as ct on n.idCliente = ct.idCategoria)
join tbGravadora as g on n.idCliente = g.IdGravadora);






 
