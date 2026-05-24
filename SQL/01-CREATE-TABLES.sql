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