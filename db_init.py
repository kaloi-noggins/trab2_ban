import psycopg2

# criação da conecção com o banco de dados
conn = psycopg2.connect(
    host="localhost",
    database="serralheria",
    user="ademir_serralheria",
    password="SenhaForte@123",
)

# população do banco com dados