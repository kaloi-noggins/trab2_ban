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

    # cliente 2
    cursor.execute('''
        INSERT INTO enderecos (cep, cidade, bairro, rua, numero) 
        VALUES ('89223-100','Joinville', 'Bom Retiro','Ten. Antônio João', 2197)
    ''')

    cursor.execute('''
        INSERT INTO clientes (nome, referencia, tipo, cpf, cnpj, razao_social, id_endereco)
        VALUES ('Carlos Henrique Dell', 'Indicação de Roberto de Bruços', 0, '98765432110', NULL ,NULL, (SELECT currval(pg_get_serial_sequence('enderecos', 'id_endereco'))))
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

    # cliente 4
    cursor.execute('''
        INSERT INTO enderecos (cep, cidade, bairro, rua, numero) 
        VALUES ('89226-000','Joinville', 'Zona Industrial Norte','Tuiuti', 4157)
    ''')

    cursor.execute('''
        INSERT INTO clientes (nome, referencia, tipo, cpf, cnpj, razao_social, id_endereco)
        VALUES ('Fort Atacadista', 'Web', 1, NULL, '09.477.652/0011-68','Sdb Comércio de Alimentos Ltda', (SELECT currval(pg_get_serial_sequence('enderecos', 'id_endereco'))))
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


# commit das transações e fechamento da conexão
conn.commit()
conn.close()