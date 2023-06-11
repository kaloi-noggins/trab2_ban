import psycopg2

# criação da conecção com o banco de dados
conn = psycopg2.connect(
    host="localhost",
    port="5433",
    database="serralheria",
    user="ademir_serralheria",
    password="SenhaForte@123",
)

# população do banco com dados de clientes

# abre um cursor para executar as qu
with conn.cursor() as cursor:

    # cliente 1
    cursor.execute('''
        INSERT INTO enderecos (cep, cidade, bairro, rua, numero) 
        VALUES ('89203001','Joinville', 'Atiradores','Ottokar Doerffel', 12)
    ''')

    cursor.execute('''
        INSERT INTO clientes (nome, referencia, tipo, cpf, cnpj, razao_social, id_endereco)
        VALUES ('Roberto de Bruços', 'Web', 0, '12345678910', NULL ,NULL, (SELECT currval(pg_get_serial_sequence('enderecos', 'id_endereco'))))
    ''')

    cursor.execute('''
        INSERT INTO servicos (descricao, metodo_pagamento, id_cliente)
        VALUES ('Cobertura de patio', 'Parcelado no debito, 30/60/90', (SELECT currval(pg_get_serial_sequence('clientes', 'id_cliente'))))
    ''')

    cursor.execute('''
        INSERT INTO orcamentos (data_entrega, valor, id_servico)
        VALUES ('2020-03-14', 8000, (SELECT currval(pg_get_serial_sequence('servicos', 'id_servico'))))
    ''')

    # cliente 2
    cursor.execute('''
        INSERT INTO enderecos (cep, cidade, bairro, rua, numero) 
        VALUES ('89223-100','Joinville', 'Bom Retiro','Ten. Antônio João', 2197)
    ''')

    cursor.execute('''
        INSERT INTO clientes (nome, referencia, tipo, cpf, cnpj, razao_social, id_endereco)
        VALUES ('Carlos Henrique Dell', 'Indicação de Roberto de Bruços', 0, '98765432110', NULL ,NULL, (SELECT currval(pg_get_serial_sequence('enderecos', 'id_endereco'))))
    ''')

    cursor.execute('''
        INSERT INTO servicos (descricao, metodo_pagamento, id_cliente)
        VALUES ('Porta de protecao selada', 'A vista no credito, mastercard', (SELECT currval(pg_get_serial_sequence('clientes', 'id_cliente'))))
    ''')

    cursor.execute('''
        INSERT INTO orcamentos (data_entrega, valor, id_servico)
        VALUES ('2018-10-12', 4500, (SELECT currval(pg_get_serial_sequence('servicos', 'id_servico'))))
    ''')

    # cliente 3
    cursor.execute('''
        INSERT INTO enderecos (cep, cidade, bairro, rua, numero) 
        VALUES ('89223-100','Joinville', 'Bom Retiro','Ten. Antônio João', 2233)
    ''')

    cursor.execute('''
        INSERT INTO clientes (nome, referencia, tipo, cpf, cnpj, razao_social, id_endereco)
        VALUES ('Maria Joaquina Intel','Indicação de Carlos Henrique Dell', 0, '987.654.321-11', NULL ,NULL, (SELECT currval(pg_get_serial_sequence('enderecos', 'id_endereco'))))
    ''')

    cursor.execute('''
        INSERT INTO servicos (descricao, metodo_pagamento, id_cliente)
        VALUES ('Jogo de grades e portas de protecao', 'Parcelado no cartao, 3 vezes', (SELECT currval(pg_get_serial_sequence('clientes', 'id_cliente'))))
    ''')

    cursor.execute('''
        INSERT INTO orcamentos (data_entrega, valor, id_servico)
        VALUES ('2021-05-01', 12000, (SELECT currval(pg_get_serial_sequence('servicos', 'id_servico'))))
    ''')

    # cliente 4
    cursor.execute('''
        INSERT INTO enderecos (cep, cidade, bairro, rua, numero) 
        VALUES ('89226-000','Joinville', 'Zona Industrial Norte','Tuiuti', 4157)
    ''')

    cursor.execute('''
        INSERT INTO clientes (nome, referencia, tipo, cpf, cnpj, razao_social, id_endereco)
        VALUES ('Fort Atacadista', 'Web', 1, NULL, '09.477.652/0011-68','Sdb Comércio de Alimentos Ltda', (SELECT currval(pg_get_serial_sequence('enderecos', 'id_endereco'))))
    ''')

    cursor.execute('''
        INSERT INTO servicos (descricao, metodo_pagamento, id_cliente)
        VALUES ('Paleteira com adaptação para empilhadeira', 'A vista no boleto', (SELECT currval(pg_get_serial_sequence('clientes', 'id_cliente'))))
    ''')

    cursor.execute('''
        INSERT INTO orcamentos (data_entrega, valor, id_servico)
        VALUES ('2022-05-28', 4800, (SELECT currval(pg_get_serial_sequence('servicos', 'id_servico'))))
    ''')

    cursor.execute('''
        INSERT INTO servicos (descricao, metodo_pagamento, id_cliente)
        VALUES ('Proteção arcondicionado', 'A vista no boleto', (SELECT currval(pg_get_serial_sequence('clientes', 'id_cliente'))))
    ''')

    cursor.execute('''
        INSERT INTO orcamentos (data_entrega, valor, id_servico)
        VALUES ('2022-08-22', 6200, (SELECT currval(pg_get_serial_sequence('servicos', 'id_servico'))))
    ''')

    cursor.execute('''
        INSERT INTO servicos (descricao, metodo_pagamento, id_cliente)
        VALUES ('Reforma estante de armazenamento de palets', 'A vista no boleto', (SELECT currval(pg_get_serial_sequence('clientes', 'id_cliente'))))
    ''')

    cursor.execute('''
        INSERT INTO orcamentos (data_entrega, valor, id_servico)
        VALUES ('2023-03-02', 3300, (SELECT currval(pg_get_serial_sequence('servicos', 'id_servico'))))
    ''')

    # cliente 5
    cursor.execute('''
        INSERT INTO enderecos (cep, cidade, bairro, rua, numero) 
        VALUES ('89223-002','Joinville', 'Bom Retiro','Av. Santos Dumont', 1170)
    ''')

    cursor.execute('''
        INSERT INTO clientes (nome, referencia, tipo, cpf, cnpj, razao_social, id_endereco)
        VALUES ('Komprão', 'Indicação Fort Atacadista', 1, NULL, '02.831.172/0024' ,'KOMPRAO KOCH ATACADISTA', (SELECT currval(pg_get_serial_sequence('enderecos', 'id_endereco'))))
    ''')

    cursor.execute('''
        INSERT INTO servicos (descricao, metodo_pagamento, id_cliente)
        VALUES ('Bicicletario', 'Parcelado no boleto, 30/60', (SELECT currval(pg_get_serial_sequence('clientes', 'id_cliente'))))
    ''')

    cursor.execute('''
        INSERT INTO orcamentos (data_entrega, valor, id_servico)
        VALUES ('2021-06-10', 1600, (SELECT currval(pg_get_serial_sequence('servicos', 'id_servico'))))
    ''')

    cursor.execute('''
        INSERT INTO servicos (descricao, metodo_pagamento, id_cliente)
        VALUES ('Serpentina sobre muro', 'Parcelado no boleto, 30/60/90', (SELECT currval(pg_get_serial_sequence('clientes', 'id_cliente'))))
    ''')

    cursor.execute('''
        INSERT INTO orcamentos (data_entrega, valor, id_servico)
        VALUES ('2022-08-12', 6500, (SELECT currval(pg_get_serial_sequence('servicos', 'id_servico'))))
    ''')


# commit das transações e fechamento da conexão
conn.commit()
conn.close()