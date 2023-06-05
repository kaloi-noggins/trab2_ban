import psycopg2

# criação da conecção com o banco de dados
conn = psycopg2.connect(
    host="localhost",
    port="5433",
    database="serralheria",
    user="ademir_serralheria",
    password="SenhaForte@123",
)

cursor  = conn.cursor()

# tabela clientes
# CREATE TABLE public.clientes (
#     id_cliente integer NOT NULL,
#     nome character varying(200) NOT NULL,
#     referencia character varying(200) NOT NULL,
#     tipo integer NOT NULL,
#     cpf character varying(14)[],
#     cnpj character varying(18)[],
#     razao_social character varying(200)[],
#     id_endereco integer NOT NULL
# );

#tabela enderecos
# CREATE TABLE public.enderecos (
#     id_endereco integer NOT NULL,
#     cep character varying(8) NOT NULL,
#     cidade character varying(50) NOT NULL,
#     bairro character varying(50) NOT NULL,
#     rua character varying(50) NOT NULL,
#     numero integer NOT NULL
# );


# população do banco com dados de clientes

cursor.execute('''
    INSERT INTO enderecos (cep, cidade, bairro, rua, numero) 
    VALUES ('89203001','Joinville', 'Atiradores','Ottokar Doerffel', 12)
''')

cursor.execute('''
    INSERT INTO clientes (nome, referencia, tipo, cpf, cnpj, razao_social, id_endereco)
    VALUES ('Roberto de Bruços', 'Web', 0, 'cpf123' NULL ,NULL, (SELECT currval(pg_get_serial_sequence('enderecos', 'id_endereco'))))
''')