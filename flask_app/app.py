import psycopg2
from flask import Flask, render_template, request
app = Flask(__name__)

# criação da conecção com o banco de dados
def get_connection():
    conn = psycopg2.connect(
        host="localhost",
        port="5433",
        database="serralheria",
        user="ademir_serralheria",
        password="SenhaForte@123",
    )
    return conn


@app.route('/')
def index():
    return render_template("index.html")

@app.route('/clientes',methods=['GET','POST'])
def lista_clientes():
    # cria conexão com o banco de dados
    with get_connection() as connection:
        with connection.cursor() as cursor:
            if request.method == 'POST':
                if request.form.get("seletor_query_clientes_cpf"):
                    cursor.execute("SELECT * FROM clientes WHERE tipo = 0")
                elif request.form.get("seletor_query_clientes_cnpj"):
                    cursor.execute("SELECT * FROM clientes WHERE tipo = 1")
                else:
                    cursor.execute("SELECT * FROM clientes")
            else:
                cursor.execute("SELECT * FROM clientes")
            
            clientes = cursor.fetchall()

    return render_template("clientes.html", clientes=clientes)