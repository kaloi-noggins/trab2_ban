CREATE DATABASE serralheria;

ALTER DATABASE serralheria OWNER TO ademir_serralheria;

\connect serralheria

-- public.enderecos definition

-- Drop table

-- DROP TABLE public.enderecos;

-- public.enderecos definition

-- Drop table

-- DROP TABLE public.enderecos;

CREATE TABLE public.enderecos (
	id_endereco serial4 NOT NULL,
	cep varchar NOT NULL,
	cidade varchar NOT NULL,
	bairro varchar NOT NULL,
    rua varchar NOT NULL,
	numero int4 NOT NULL,
	CONSTRAINT enderecos_pk PRIMARY KEY (id_endereco)
);

-- Permissions

ALTER TABLE public.enderecos OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.enderecos TO ademir_serralheria;


-- public.insumos definition

-- Drop table

-- DROP TABLE public.insumos;

CREATE TABLE public.insumos (
	id_insumo serial4 NOT NULL,
	nome varchar NOT NULL,
	tipo_insumo varchar NOT NULL,
	custo money NOT NULL,
	CONSTRAINT insumos_pk PRIMARY KEY (id_insumo)
);

-- Permissions

ALTER TABLE public.insumos OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.insumos TO ademir_serralheria;


-- public.clientes definition

-- Drop table

-- DROP TABLE public.clientes;

CREATE TABLE public.clientes (
	id_cliente serial4 NOT NULL,
	nome varchar NOT NULL,
	referencia varchar NOT NULL,
	tipo int4 NOT NULL,
	cpf varchar NULL,
	cnpj varchar NULL,
	razao_social varchar NULL,
	id_endereco int4 NOT NULL,
	CONSTRAINT clientes_pk PRIMARY KEY (id_cliente),
	CONSTRAINT clientes_fk FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id_endereco)
);

-- Permissions

ALTER TABLE public.clientes OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.clientes TO ademir_serralheria;


-- public.servicos definition

-- Drop table

-- DROP TABLE public.servicos;

CREATE TABLE public.servicos (
	id_servico serial4 NOT NULL,
	descricao varchar NOT NULL,
	metodo_pagamento varchar NOT NULL,
	id_cliente int4 NOT NULL,
	CONSTRAINT servicos_pk PRIMARY KEY (id_servico),
	CONSTRAINT servicos_fk FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente)
);

-- Permissions

ALTER TABLE public.servicos OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.servicos TO ademir_serralheria;


-- public.orcamentos definition

-- Drop table

-- DROP TABLE public.orcamentos;

CREATE TABLE public.orcamentos (
	id_orcamento serial4 NOT NULL,
	data_entrega date NOT NULL,
	valor money NOT NULL,
	id_servico int4 NOT NULL,
	CONSTRAINT orcamentos_pk PRIMARY KEY (id_orcamento),
	CONSTRAINT orcamentos_fk FOREIGN KEY (id_servico) REFERENCES public.servicos(id_servico)
);

-- Permissions

ALTER TABLE public.orcamentos OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.orcamentos TO ademir_serralheria;


-- public.projeto definition

-- Drop table

-- DROP TABLE public.projeto;

CREATE TABLE public.projeto (
	id_projeto serial4 NOT NULL,
	desenho_tecnico bytea NOT NULL,
	peso numeric NOT NULL,
	tempo_execucao int4 NOT NULL,
	id_orcamento int4 NOT NULL,
	CONSTRAINT projeto_pk PRIMARY KEY (id_projeto),
	CONSTRAINT projeto_fk FOREIGN KEY (id_orcamento) REFERENCES public.orcamentos(id_orcamento)
);

-- Permissions

ALTER TABLE public.projeto OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.projeto TO ademir_serralheria;


-- public.orcamentos_tem_insumos definition

-- Drop table

-- DROP TABLE public.orcamentos_tem_insumos;

CREATE TABLE public.orcamentos_tem_insumos (
	id serial4 NOT NULL,
	id_insumo int4 NOT NULL,
	id_orcamento int4 NOT NULL,
	CONSTRAINT orcamentos_tem_insumos_pk PRIMARY KEY (id),
	CONSTRAINT orcamentos_tem_insumos_fk FOREIGN KEY (id_insumo) REFERENCES public.insumos(id_insumo),
	CONSTRAINT orcamentos_tem_insumos_fk_1 FOREIGN KEY (id_orcamento) REFERENCES public.orcamentos(id_orcamento)
);

-- Permissions

ALTER TABLE public.orcamentos_tem_insumos OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.orcamentos_tem_insumos TO ademir_serralheria;


-- public.fornecedores definition

-- Drop table

-- DROP TABLE public.fornecedores;

CREATE TABLE public.fornecedores (
	id_fornecedor serial4 NOT NULL,
	nome varchar NOT NULL,
	cnpj varchar NOT NULL,
	id_endereco int4 NOT NULL,
	CONSTRAINT fornecedores_pk PRIMARY KEY (id_fornecedor),
	CONSTRAINT fornecedores_fk FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id_endereco)
);

-- Permissions

ALTER TABLE public.fornecedores OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.fornecedores TO ademir_serralheria;


-- public.insumos_tem_fornecedores definition

-- Drop table

-- DROP TABLE public.insumos_tem_fornecedores;

CREATE TABLE public.insumos_tem_fornecedores (
	id serial4 NOT NULL,
	id_insumo int4 NOT NULL,
	id_fornecedor int4 NOT NULL,
	CONSTRAINT insumos_tem_fornecedores_pk PRIMARY KEY (id),
	CONSTRAINT insumos_tem_fornecedores_fk FOREIGN KEY (id_insumo) REFERENCES public.insumos(id_insumo),
	CONSTRAINT insumos_tem_fornecedores_fk_1 FOREIGN KEY (id_fornecedor) REFERENCES public.fornecedores(id_fornecedor)
);

-- Permissions

ALTER TABLE public.insumos_tem_fornecedores OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.insumos_tem_fornecedores TO ademir_serralheria;


-- public.prestadores_servicos definition

-- Drop table

-- DROP TABLE public.prestadores_servicos;

CREATE TABLE public.prestadores_servicos (
	id_prestador_servico serial4 NOT NULL,
	nome varchar NOT NULL,
	cnpj varchar NOT NULL,
	tipo_servico varchar NOT NULL,
	custo money NOT NULL,
	id_endereco int4 NOT NULL,
	CONSTRAINT prestadores_servicos_pk PRIMARY KEY (id_prestador_servico),
	CONSTRAINT prestadores_servicos_fk FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id_endereco)
);

-- Permissions

ALTER TABLE public.prestadores_servicos OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.prestadores_servicos TO ademir_serralheria;


-- public.orcamentos_tem_prestadores_servicos definition

-- Drop table

-- DROP TABLE public.orcamentos_tem_prestadores_servicos;

CREATE TABLE public.orcamentos_tem_prestadores_servicos (
	id serial4 NOT NULL,
	id_orcamento int4 NULL,
	id_prestador_servico int4 NOT NULL,
	CONSTRAINT orcamentos_tem_prestadores_servicos_pk PRIMARY KEY (id),
	CONSTRAINT orcamentos_tem_prestadores_servicos_fk FOREIGN KEY (id_orcamento) REFERENCES public.orcamentos(id_orcamento),
	CONSTRAINT orcamentos_tem_prestadores_servicos_fk_1 FOREIGN KEY (id_prestador_servico) REFERENCES public.prestadores_servicos(id_prestador_servico)
);

-- Permissions

ALTER TABLE public.orcamentos_tem_prestadores_servicos OWNER TO ademir_serralheria;
GRANT ALL ON TABLE public.orcamentos_tem_prestadores_servicos TO ademir_serralheria;