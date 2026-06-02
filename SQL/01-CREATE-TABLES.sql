create table if not exists TIPOS_EMPRESA_TESTE (
	tipo varchar(30),
	constraint PK_Nome_Tipo_Empresa primary key(tipo)
);

create table if not exists EMPRESA_TESTE (
	nome varchar(30),
	senha varchar(100) not null,
	tipo varchar(30) not null,
	constraint PK_Nome_Empresa primary key(nome),
	constraint FK_Tipo_Empresa foreign key(tipo) references tipos_empresa_teste(tipo)
);

create table if not exists RESERVAS_MES (
	nomeEmpresa varchar(30),
	mes varchar(3),
	nroReservas int not null,
	constraint PK_Reservas_Mes primary key (nomeEmpresa, mes),
	constraint FK_Reservas_Mes_Nome_Empresa foreign key(nomeEmpresa) references EMPRESA_TESTE(nome),
	constraint CK_Reservas_Mes_Mes_Real check(mes in ('JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN', 'JUL',
														'AGO', 'SET', 'OUT', 'NOV', 'DEZ')),
	constraint CK_Nro_Reservas_Positivo check(nroReservas > 0)
)