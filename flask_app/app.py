import psycopg2
import os
from flask import Flask, render_template, request, redirect, send_from_directory

serralheria = Flask(__name__)

# Conecção com o banco
def get_connection():
    conn = psycopg2.connect(
        host="localhost",
        port="5433",
        database="serralheria",
        user="ademir_serralheria",
        password="SenhaForte@123",
    )
    return conn

# Rotas primarias
@serralheria.route('/favicon.gif')
def favicon():
    return send_from_directory(os.path.join(serralheria.root_path, 'static'),'favicon.gif')

@serralheria.route('/')
def index():
    return render_template("index.html")

# Clientes
@serralheria.route('/clientes',methods=['GET','POST'])
def clientes_consulta():
    
    with get_connection() as connection:
        with connection.cursor() as cursor:
            if request.method == 'POST':
                tipo = request.form.get("seletor_query_clientes")
                if tipo=="cpf":
                    cursor.execute("SELECT * FROM clientes WHERE tipo = 0")
                elif tipo=="cnpj":
                    cursor.execute("SELECT * FROM clientes WHERE tipo = 1")
                elif tipo=="valor":
                    min = request.form.get("valor_min")
                    max = request.form.get("valor_max")
                    cursor.execute('''
                    SELECT *
                    FROM clientes
                    WHERE id_cliente IN (
                            SELECT id_cliente
                            FROM servicos s
                                JOIN orcamentos o ON s.id_servico = o.id_servico
                            WHERE o.valor BETWEEN %s AND %s 
                        )
                    ''',(min,max))
                elif tipo=="cliente_mais_caro":
                    cursor.execute('''
                    SELECT *
                    FROM clientes
                    WHERE id_cliente IN (
                            SELECT id_cliente
                            FROM servicos s
                                JOIN orcamentos o ON s.id_servico = o.id_servico
                            WHERE o.valor IN (SELECT MAX(valor) FROM orcamentos)
                        )
                    ''')
                elif tipo=="cliente_mais_barato":
                    cursor.execute('''
                    SELECT *
                    FROM clientes
                    WHERE id_cliente IN (
                            SELECT id_cliente
                            FROM servicos s
                                JOIN orcamentos o ON s.id_servico = o.id_servico
                            WHERE o.valor IN (SELECT MIN(valor) FROM orcamentos)
                        )
                    ''')
                elif tipo=="sem_orcamento":
                    cursor.execute('''
                    SELECT *
                    FROM clientes
                    WHERE id_cliente NOT IN (
                            SELECT id_cliente
                            FROM servicos s
                                JOIN orcamentos o ON s.id_servico = o.id_servico
                        )
                    ''')
                else:
                    cursor.execute("SELECT * FROM clientes")
            else:
                cursor.execute("SELECT * FROM clientes")
            
            clientes = cursor.fetchall()

    return render_template("clientes/consulta.html", clientes=clientes)

@serralheria.route('/clientes/cadastro',methods=['GET','POST'])
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

                cursor.execute('''
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
                    cursor.execute('''
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
                
    return render_template("clientes/cadastro.html")

# Servicos
@serralheria.route('/servicos',methods=['GET'])
def servicos_consulta():
    
    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute('''
            SELECT descricao, metodo_pagamento, nome FROM servicos
            JOIN clientes ON servicos.id_cliente = clientes.id_cliente
            ''')
            servicos = cursor.fetchall()

    return render_template("servicos/consulta.html", servicos=servicos)

@serralheria.route("/servicos/cadastro",methods=["GET","POST"])
def servicos_cadastro():
    
    # pega os dados do cliente
    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute("SELECT id_cliente,nome FROM clientes")
            clientes = cursor.fetchall()
            print(clientes)

    with get_connection() as connection:
        with connection.cursor() as cursor:
            if request.method == "POST":
                descricao = request.form.get("descricao")
                metodo = request.form.get("metodo_pagamento")
                cliente_servico = request.form.get("cliente")
                id_cliente = None

                # troca o nome do cliente pela id
                for cliente in clientes:
                    if cliente_servico == cliente[1]:
                        id_cliente = cliente[0]

                print(id_cliente)
                if id_cliente == None:
                    return redirect("/cadastro")
                
                print(descricao,metodo,id_cliente)
                cursor.execute('''
                INSERT INTO servicos (descricao, metodo_pagamento, id_cliente)
                VALUES (%s, %s, %s)
                ''',(descricao,metodo,id_cliente))
                connection.commit()

                return redirect("/servicos")
    
    return render_template("servicos/cadastro.html",clientes=clientes)

# Orcamentos
@serralheria.route("/orcamentos",methods=["GET","POST"])
def orcamentos_consulta():
    
    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute("SELECT SUM(valor) FROM orcamentos")
            # retorna lista de tuplas, entao pega primeiro indice da primeira tupla
            total = cursor.fetchall()[0][0]
            cursor.execute('''
                    SELECT valor,
                        data_entrega,
                        descricao,
                        metodo_pagamento,
                        nome
                    FROM orcamentos
                        JOIN servicos ON orcamentos.id_servico = servicos.id_servico
                        JOIN clientes ON servicos.id_cliente = clientes.id_cliente
                    ORDER BY data_entrega ASC
                    ''')
            orcamentos = cursor.fetchall()
            
    with get_connection() as connection:
        with connection.cursor() as cursor:
            if request.method == "POST":
                tipo = request.form.get("seletor_query_orcamento")

                if tipo == "data_max":
                    cursor.execute('''
                    SELECT valor,
                        data_entrega,
                        descricao,
                        metodo_pagamento,
                        nome
                    FROM orcamentos
                        JOIN servicos ON orcamentos.id_servico = servicos.id_servico
                        JOIN clientes ON servicos.id_cliente = clientes.id_cliente
                    ORDER BY data_entrega DESC
                    ''')
                    orcamentos = cursor.fetchall()
                elif tipo == "data_min":
                    cursor.execute('''
                    SELECT valor,
                        data_entrega,
                        descricao,
                        metodo_pagamento,
                        nome
                    FROM orcamentos
                        JOIN servicos ON orcamentos.id_servico = servicos.id_servico
                        JOIN clientes ON servicos.id_cliente = clientes.id_cliente
                    ORDER BY data_entrega ASC
                    ''')
                    orcamentos = cursor.fetchall()
                elif tipo == "intervalo_valor":
                    min = request.form.get("valor_min")
                    max = request.form.get("valor_max")
                    cursor.execute('''
                    SELECT valor,
                        data_entrega,
                        descricao,
                        metodo_pagamento,
                        nome
                    FROM orcamentos
                        JOIN servicos ON orcamentos.id_servico = servicos.id_servico
                        JOIN clientes ON servicos.id_cliente = clientes.id_cliente
                    WHERE valor BETWEEN %s AND %s
                    ''',(min,max))
                    orcamentos = cursor.fetchall()
                    
                    cursor.execute("SELECT SUM(valor) FROM orcamentos WHERE valor BETWEEN %s AND %s",(min,max))
                    # retorna lista de tuplas, entao pega primeiro indice da primeira tupla
                    total = cursor.fetchall()[0][0]

    return render_template("orcamentos/consulta.html",total=total,orcamentos=orcamentos)

@serralheria.route("/orcamentos/cadastro",methods=["GET","POST"])
def orcamentos_cadastro():
    return render_template("orcamentos/cadastro.html")

# Projetos
@serralheria.route("/projetos",methods=["GET","POST"])
def projetos_consulta():
    return render_template("projetos/consulta.html")

@serralheria.route("/projetos/cadastro",methods=["GET","POST"])
def projetos_cadastro():
    return render_template("projetos/cadastro.html")

# Insumos
@serralheria.route("/insumos",methods=["GET","POST"])
def insumos_consulta():
    return render_template("insumos/consulta.html")

@serralheria.route("/insumos/cadastro",methods=["GET","POST"])
def insumos_cadastro():
    return render_template("insumos/cadastro.html")

# Fornecedores
@serralheria.route("/fornecedores",methods=["GET","POST"])
def fornecedores_consulta():
    return render_template("fornecedores/consulta.html")

@serralheria.route("/fornecedores/cadastro",methods=["GET","POST"])
def fornecedores_cadastro():
    return render_template("fornecedores/cadastro.html")

# Prestadores_servicos
@serralheria.route("/prestadores_servicos",methods=["GET","POST"])
def prestadores_servicos_consulta():
    return render_template("prestadores_servicos/consulta.html")

@serralheria.route("/prestadores_servicos/cadastro",methods=["GET","POST"])
def prestadores_servicos_cadastro():
    return render_template("prestadores_servicos/cadastro.html")