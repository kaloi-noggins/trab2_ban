from app import serralheria
import unittest

# testa index
class TestaIndex(unittest.TestCase):

    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/")

    # testa se GET está funcionando adequadamente
    def test_index(self):
        self.assertEqual(200, self.response.status_code)

    # testa se o html está correto vendo se a mensagem de boas vindas está nele
    def test_html_string_reponse(self):
        response = "Bem vindo ao sistema de consulta da JHC Serralheria! Use o menu acima para acessar as áreas de consulta do sistema."
        self.assertIn(response,self.response.data.decode("utf-8"))

### testes clientes ###

# testa cliente_consultas
class TestaClienteConsulta(unittest.TestCase):

    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/clientes")
    
    # testa se GET de cleinte_consulta está funcionando
    def test_cliente_consulta_get(self):
        self.assertEqual(200, self.response.status_code)

    def test_html_string_reponse(self):
        response = "Clientes - Consultas"
        self.assertIn(response,self.response.data.decode("utf-8"))

# testa cliente_consultas
class TestaClienteCadastro(unittest.TestCase):

    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/clientes/cadastro")
    
    def test_html_string_reponse(self):
        response = "Clientes - Cadastro"
        self.assertIn(response,self.response.data.decode("utf-8"))

    # testa se GET de cleinte_cadastro está funcionando
    def test_cliente_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)

####

# testa servico_consultas
class TestaServicoConsulta(unittest.TestCase):

    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/servicos")
    
    def test_html_string_reponse(self):
        response = "Serviços - Consulta"
        self.assertIn(response,self.response.data.decode("utf-8"))

    # testa se GET de cleinte_consulta está funcionando
    def test_servico_consulta_get(self):
        self.assertEqual(200, self.response.status_code)

# testa servico_consultas
class TestaServicoCadastro(unittest.TestCase):

    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/servicos/cadastro")
    
    def test_html_string_reponse(self):
        response = "Serviços - Cadastro"
        self.assertIn(response,self.response.data.decode("utf-8"))
    
    # testa se GET de cleinte_cadastro está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)


### testes orcamentos ###

# testa orcamentos_consulta
class TestaOrcamentosConsulta(unittest.TestCase):
    
    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/orcamentos")
    
    def test_html_string_reponse(self):
        response = "Orçamentos - Consulta"
        self.assertIn(response,self.response.data.decode("utf-8"))

    # testa se GET de orcamentos_consulta está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)

# testa orcamentos_cadastro
class TestaOrcamentosCadastro(unittest.TestCase):
    
    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/orcamentos/cadastro")
    
    # testa se GET de orcamentos_consulta está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)

### testes projetos ###

# testa projetos_consulta
class TestaProjetosConsulta(unittest.TestCase):
    
    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/projetos")
    
    # testa se GET de servico_consulta está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)

# testa projetos_cadastro
class TestaProjetoCadastro(unittest.TestCase):
    
    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/projetos/cadastro")
    
    # testa se GET de servico_projetos está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)

### testes insumos ###

# testa insumos_consulta
class TestaInsumosConsulta(unittest.TestCase):
    
    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/insumos")
    
    # testa se GET de servico_consulta está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)

# testa insumos_cadastro
class TestaInsumosCadastro(unittest.TestCase):
    
    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/insumos/cadastro")
    
    # testa se GET de servico_insumos está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)


### testes fornecedores ###

# testa fornecedores_consulta
class TestaFornecedoresConsulta(unittest.TestCase):
    
    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/fornecedores")
    
    # testa se GET de servico_consulta está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)

# testa fornecedores_cadastro
class TestaFornecedoresCadastro(unittest.TestCase):
    
    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/fornecedores/cadastro")
    
    # testa se GET de servico_fornecedores está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)

### testes prestadores_servicos ###

# testa prestadores_servicos_consulta
class TestaPrestadoresServicosConsulta(unittest.TestCase):
    
    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/prestadores_servicos")
    
    # testa se GET de servico_consulta está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)

# testa prestadores_servicos_cadastro
class TestaPrestadoresServicosCadastro(unittest.TestCase):
    
    # método constutor para criar app de test
    def setUp(self):
        test_app = serralheria.test_client()
        self.response = test_app.get("/prestadores_servicos/cadastro")
    
    # testa se GET de servico_prestadores_servicos está funcionando
    def test_servico_cadastro_get(self):
        self.assertEqual(200, self.response.status_code)
