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

result = cursor.execute("select * from clientes;")
# população do banco com dados

print(result)