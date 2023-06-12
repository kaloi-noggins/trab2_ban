import psycopg2
from flask import Flask, render_template, request,redirect
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
def clientes_consulta():
    
    with get_connection() as connection:
        with connection.cursor() as cursor:
            if request.method == 'POST':
                tipo = request.form.get("seletor_query_clientes")
                if tipo=="cpf":
                    cursor.execute("SELECT * FROM clientes WHERE tipo = 0")
                elif tipo=="cnpj":
                    cursor.execute("SELECT * FROM clientes WHERE tipo = 1")
                else:
                    cursor.execute("SELECT * FROM clientes")
            else:
                cursor.execute("SELECT * FROM clientes")
            
            clientes = cursor.fetchall()

    return render_template("clientes.html", clientes=clientes)

@app.route('/clientes/cadastro',methods=['GET','POST'])
def clientes_cadastro():
    with get_connection() as connection:
        with connection.cursor() as cursor:
            if request.method == "POST":
            
                # dados de endereco
                cep = request.form.get("cep")
                cidade = request.form.get("cidade")
                bairro = request.form.get("bairro")
                rua = request.form.get("rua")
                numero = request.form.get("numero")

                cursor.execute(
                '''
                INSERT INTO enderecos (cep,cidade,bairro,rua,numero) 
                VALUES (%s,%s,%s,%s,%s)
                ''', (cep,cidade,bairro,rua,numero)
                )

                connection.commit()

                # pega o id do ultimo endeço para inserir na chave estrangeira de clientes
                cursor.execute('''
                SELECT currval(pg_get_serial_sequence('enderecos', 'id_endereco'))
                ''')
                id_endereco = cursor.fetchone()

                print(id_endereco)
                # dados do cliente
                nome = request.form.get("nome")
                referencia = request.form.get("referencia")

                # seleciona tipo de pessoa a  partir do botao radio
                temp = request.form.get("seletor_tipo_pesoa")
                print(temp)
                if temp == "cpf":
                    cpf = request.form.get("cpf")
                    cursor.execute(
                    '''
                    INSERT INTO clientes (nome,referencia,tipo,cpf,cnpj,razao_social,id_endereco)
                    VALUES (%s,%s,%s,%s,%s,%s,%s)                        
                    ''', (nome,referencia,0,cpf,None,None,id_endereco))
                    connection.commit()    
                else:
                    cnpj = request.form.get("cnpj")
                    razao_social = request.form.get("razao_social")
                    cursor.execute(
                    '''
                    INSERT INTO clientes (nome,referencia,tipo,cpf,cnpj,razao_social,id_endereco)
                    VALUES (%s,%s,%s,%s,%s,%s,%s)                        
                    ''', (nome,referencia,1,None,cnpj,razao_social,id_endereco))
                    connection.commit()
                
                return redirect("/clientes")
                
    return render_template("clientes_cadastro.html")

@app.route('/servicos',methods=['GET'])
def servicos_consulta():
    
    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM servicos")
            servicos = cursor.fetchall()

    return render_template("servicos.html", servicos=servicos)