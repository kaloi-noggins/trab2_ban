--
-- TOC entry 215 (class 1259 OID 16452)
-- Name: clientes; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nome character varying(200) NOT NULL,
    referencia character varying(200) NOT NULL,
    tipo integer NOT NULL,
    cpf character varying(14) [],
    cnpj character varying(18) [],
    razao_social character varying(200) [],
    id_endereco integer NOT NULL
);
ALTER TABLE public.clientes OWNER TO ademir_serralheria;
--
-- TOC entry 214 (class 1259 OID 16451)
-- Name: clientes_id_clientes_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.clientes_id_clientes_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.clientes_id_clientes_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 214
-- Name: clientes_id_clientes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.clientes_id_clientes_seq OWNED BY public.clientes.id_cliente;
--
-- TOC entry 218 (class 1259 OID 16467)
-- Name: clientes_id_endereco_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.clientes_id_endereco_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.clientes_id_endereco_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 218
-- Name: clientes_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.clientes_id_endereco_seq OWNED BY public.clientes.id_endereco;
--
-- TOC entry 217 (class 1259 OID 16461)
-- Name: enderecos; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.enderecos (
    id_endereco integer NOT NULL,
    cep character varying(8) NOT NULL,
    cidade character varying(50) NOT NULL,
    bairro character varying(50) NOT NULL,
    rua character varying(50) NOT NULL,
    numero integer NOT NULL
);
ALTER TABLE public.enderecos OWNER TO ademir_serralheria;
--
-- TOC entry 216 (class 1259 OID 16460)
-- Name: enderecos_id_endereco_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.enderecos_id_endereco_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.enderecos_id_endereco_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 216
-- Name: enderecos_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.enderecos_id_endereco_seq OWNED BY public.enderecos.id_endereco;
--
-- TOC entry 232 (class 1259 OID 16528)
-- Name: fornecedores; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.fornecedores (
    id_fornecedor integer NOT NULL,
    nome character varying(200) NOT NULL,
    cnpj character varying(18) NOT NULL,
    id_endereco integer NOT NULL
);
ALTER TABLE public.fornecedores OWNER TO ademir_serralheria;
--
-- TOC entry 231 (class 1259 OID 16527)
-- Name: fornecedores_id_endereco_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.fornecedores_id_endereco_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.fornecedores_id_endereco_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 231
-- Name: fornecedores_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.fornecedores_id_endereco_seq OWNED BY public.fornecedores.id_endereco;
--
-- TOC entry 230 (class 1259 OID 16526)
-- Name: fornecedores_id_fornecedor_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.fornecedores_id_fornecedor_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.fornecedores_id_fornecedor_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 230
-- Name: fornecedores_id_fornecedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.fornecedores_id_fornecedor_seq OWNED BY public.fornecedores.id_fornecedor;
--
-- TOC entry 229 (class 1259 OID 16520)
-- Name: insumos; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.insumos (
    id_insumo integer NOT NULL,
    nome character varying(200) NOT NULL,
    tipo_insumo character varying(200) NOT NULL,
    custo money NOT NULL
);
ALTER TABLE public.insumos OWNER TO ademir_serralheria;
--
-- TOC entry 228 (class 1259 OID 16519)
-- Name: insumos_id_insumo_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.insumos_id_insumo_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.insumos_id_insumo_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 228
-- Name: insumos_id_insumo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.insumos_id_insumo_seq OWNED BY public.insumos.id_insumo;
--
-- TOC entry 243 (class 1259 OID 16579)
-- Name: insumos_tem_fornecedores; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.insumos_tem_fornecedores (
    id integer NOT NULL,
    id_insumo integer NOT NULL,
    id_fornecedor integer NOT NULL
);
ALTER TABLE public.insumos_tem_fornecedores OWNER TO ademir_serralheria;
--
-- TOC entry 242 (class 1259 OID 16578)
-- Name: insumos_tem_fornecedores_id_fornecedor_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.insumos_tem_fornecedores_id_fornecedor_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.insumos_tem_fornecedores_id_fornecedor_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 242
-- Name: insumos_tem_fornecedores_id_fornecedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.insumos_tem_fornecedores_id_fornecedor_seq OWNED BY public.insumos_tem_fornecedores.id_fornecedor;
--
-- TOC entry 241 (class 1259 OID 16577)
-- Name: insumos_tem_fornecedores_id_insumo_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.insumos_tem_fornecedores_id_insumo_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.insumos_tem_fornecedores_id_insumo_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 241
-- Name: insumos_tem_fornecedores_id_insumo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.insumos_tem_fornecedores_id_insumo_seq OWNED BY public.insumos_tem_fornecedores.id_insumo;
--
-- TOC entry 240 (class 1259 OID 16576)
-- Name: insumos_tem_fornecedores_id_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.insumos_tem_fornecedores_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.insumos_tem_fornecedores_id_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 240
-- Name: insumos_tem_fornecedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.insumos_tem_fornecedores_id_seq OWNED BY public.insumos_tem_fornecedores.id;
--
-- TOC entry 227 (class 1259 OID 16507)
-- Name: orcamentos; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.orcamentos (
    id_orcamento integer NOT NULL,
    data_entrega timestamp without time zone NOT NULL,
    valor money NOT NULL,
    id_servico integer NOT NULL
);
ALTER TABLE public.orcamentos OWNER TO ademir_serralheria;
--
-- TOC entry 247 (class 1259 OID 16600)
-- Name: orcamentos_contratam_prestadores; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.orcamentos_contratam_prestadores (
    id integer NOT NULL,
    id_orcamento integer NOT NULL,
    id_fornecedores integer NOT NULL
);
ALTER TABLE public.orcamentos_contratam_prestadores OWNER TO ademir_serralheria;
--
-- TOC entry 246 (class 1259 OID 16599)
-- Name: orcamentos_contratam_prestadores_id_fornecedores_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.orcamentos_contratam_prestadores_id_fornecedores_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.orcamentos_contratam_prestadores_id_fornecedores_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 246
-- Name: orcamentos_contratam_prestadores_id_fornecedores_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.orcamentos_contratam_prestadores_id_fornecedores_seq OWNED BY public.orcamentos_contratam_prestadores.id_fornecedores;
--
-- TOC entry 245 (class 1259 OID 16598)
-- Name: orcamentos_contratam_prestadores_id_orcamento_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.orcamentos_contratam_prestadores_id_orcamento_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.orcamentos_contratam_prestadores_id_orcamento_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 245
-- Name: orcamentos_contratam_prestadores_id_orcamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.orcamentos_contratam_prestadores_id_orcamento_seq OWNED BY public.orcamentos_contratam_prestadores.id_orcamento;
--
-- TOC entry 244 (class 1259 OID 16597)
-- Name: orcamentos_contratam_prestadores_id_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.orcamentos_contratam_prestadores_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.orcamentos_contratam_prestadores_id_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 244
-- Name: orcamentos_contratam_prestadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.orcamentos_contratam_prestadores_id_seq OWNED BY public.orcamentos_contratam_prestadores.id;
--
-- TOC entry 225 (class 1259 OID 16505)
-- Name: orcamentos_id_orcamento_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.orcamentos_id_orcamento_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.orcamentos_id_orcamento_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 225
-- Name: orcamentos_id_orcamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.orcamentos_id_orcamento_seq OWNED BY public.orcamentos.id_orcamento;
--
-- TOC entry 226 (class 1259 OID 16506)
-- Name: orcamentos_id_servico_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.orcamentos_id_servico_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.orcamentos_id_servico_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 226
-- Name: orcamentos_id_servico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.orcamentos_id_servico_seq OWNED BY public.orcamentos.id_servico;
--
-- TOC entry 236 (class 1259 OID 16543)
-- Name: orcamentos_tem_insumos; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.orcamentos_tem_insumos (
    id integer NOT NULL,
    id_orcamento integer NOT NULL,
    id_insumo integer NOT NULL
);
ALTER TABLE public.orcamentos_tem_insumos OWNER TO ademir_serralheria;
--
-- TOC entry 235 (class 1259 OID 16542)
-- Name: orcamentos_tem_insumos_id_insumo_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.orcamentos_tem_insumos_id_insumo_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.orcamentos_tem_insumos_id_insumo_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 235
-- Name: orcamentos_tem_insumos_id_insumo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.orcamentos_tem_insumos_id_insumo_seq OWNED BY public.orcamentos_tem_insumos.id_insumo;
--
-- TOC entry 234 (class 1259 OID 16541)
-- Name: orcamentos_tem_insumos_id_orcamento_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.orcamentos_tem_insumos_id_orcamento_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.orcamentos_tem_insumos_id_orcamento_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 234
-- Name: orcamentos_tem_insumos_id_orcamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.orcamentos_tem_insumos_id_orcamento_seq OWNED BY public.orcamentos_tem_insumos.id_orcamento;
--
-- TOC entry 233 (class 1259 OID 16540)
-- Name: orcamentos_tem_insumos_id_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.orcamentos_tem_insumos_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.orcamentos_tem_insumos_id_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 233
-- Name: orcamentos_tem_insumos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.orcamentos_tem_insumos_id_seq OWNED BY public.orcamentos_tem_insumos.id;
--
-- TOC entry 239 (class 1259 OID 16564)
-- Name: prestadores_servicos; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.prestadores_servicos (
    id_prestador integer NOT NULL,
    nome character varying(200) NOT NULL,
    cnpj character varying(18) NOT NULL,
    tipo_servico character varying(200) NOT NULL,
    custo money NOT NULL,
    id_endereco integer NOT NULL
);
ALTER TABLE public.prestadores_servicos OWNER TO ademir_serralheria;
--
-- TOC entry 238 (class 1259 OID 16563)
-- Name: prestadores_servicos_id_endereco_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.prestadores_servicos_id_endereco_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.prestadores_servicos_id_endereco_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 238
-- Name: prestadores_servicos_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.prestadores_servicos_id_endereco_seq OWNED BY public.prestadores_servicos.id_endereco;
--
-- TOC entry 237 (class 1259 OID 16562)
-- Name: prestadores_servicos_id_prestador_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.prestadores_servicos_id_prestador_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.prestadores_servicos_id_prestador_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 237
-- Name: prestadores_servicos_id_prestador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.prestadores_servicos_id_prestador_seq OWNED BY public.prestadores_servicos.id_prestador;
--
-- TOC entry 221 (class 1259 OID 16482)
-- Name: projetos; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.projetos (
    id_projeto integer NOT NULL,
    desenho_tecnico bytea,
    medidas real NOT NULL,
    peso real NOT NULL,
    tempo_execucao daterange NOT NULL,
    id_orcamento integer NOT NULL
);
ALTER TABLE public.projetos OWNER TO ademir_serralheria;
--
-- TOC entry 220 (class 1259 OID 16481)
-- Name: projetos_id_orcamento_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.projetos_id_orcamento_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.projetos_id_orcamento_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 220
-- Name: projetos_id_orcamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.projetos_id_orcamento_seq OWNED BY public.projetos.id_orcamento;
--
-- TOC entry 219 (class 1259 OID 16480)
-- Name: projetos_id_projeto_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.projetos_id_projeto_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.projetos_id_projeto_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 219
-- Name: projetos_id_projeto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.projetos_id_projeto_seq OWNED BY public.projetos.id_projeto;
--
-- TOC entry 224 (class 1259 OID 16493)
-- Name: servicos; Type: TABLE; Schema: public; Owner: ademir_serralheria
--

CREATE TABLE public.servicos (
    id_servico integer NOT NULL,
    descricao character varying(200) NOT NULL,
    metodo_pagamento character varying(200) NOT NULL,
    id_cliente integer NOT NULL
);
ALTER TABLE public.servicos OWNER TO ademir_serralheria;
--
-- TOC entry 223 (class 1259 OID 16492)
-- Name: servicos_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.servicos_id_cliente_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.servicos_id_cliente_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 223
-- Name: servicos_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.servicos_id_cliente_seq OWNED BY public.servicos.id_cliente;
--
-- TOC entry 222 (class 1259 OID 16491)
-- Name: servicos_id_servico_seq; Type: SEQUENCE; Schema: public; Owner: ademir_serralheria
--

CREATE SEQUENCE public.servicos_id_servico_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.servicos_id_servico_seq OWNER TO ademir_serralheria;
--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 222
-- Name: servicos_id_servico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ademir_serralheria
--

ALTER SEQUENCE public.servicos_id_servico_seq OWNED BY public.servicos.id_servico;
--
-- TOC entry 4268 (class 2604 OID 16468)
-- Name: clientes id_endereco; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.clientes
ALTER COLUMN id_endereco
SET DEFAULT nextval('public.clientes_id_endereco_seq'::regclass);
--
-- TOC entry 4269 (class 2604 OID 16464)
-- Name: enderecos id_endereco; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.enderecos
ALTER COLUMN id_endereco
SET DEFAULT nextval('public.enderecos_id_endereco_seq'::regclass);
--
-- TOC entry 4277 (class 2604 OID 16531)
-- Name: fornecedores id_fornecedor; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.fornecedores
ALTER COLUMN id_fornecedor
SET DEFAULT nextval(
        'public.fornecedores_id_fornecedor_seq'::regclass
    );
--
-- TOC entry 4278 (class 2604 OID 16532)
-- Name: fornecedores id_endereco; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.fornecedores
ALTER COLUMN id_endereco
SET DEFAULT nextval('public.fornecedores_id_endereco_seq'::regclass);
--
-- TOC entry 4276 (class 2604 OID 16523)
-- Name: insumos id_insumo; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.insumos
ALTER COLUMN id_insumo
SET DEFAULT nextval('public.insumos_id_insumo_seq'::regclass);
--
-- TOC entry 4284 (class 2604 OID 16582)
-- Name: insumos_tem_fornecedores id; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.insumos_tem_fornecedores
ALTER COLUMN id
SET DEFAULT nextval(
        'public.insumos_tem_fornecedores_id_seq'::regclass
    );
--
-- TOC entry 4285 (class 2604 OID 16583)
-- Name: insumos_tem_fornecedores id_insumo; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.insumos_tem_fornecedores
ALTER COLUMN id_insumo
SET DEFAULT nextval(
        'public.insumos_tem_fornecedores_id_insumo_seq'::regclass
    );
--
-- TOC entry 4286 (class 2604 OID 16584)
-- Name: insumos_tem_fornecedores id_fornecedor; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.insumos_tem_fornecedores
ALTER COLUMN id_fornecedor
SET DEFAULT nextval(
        'public.insumos_tem_fornecedores_id_fornecedor_seq'::regclass
    );
--
-- TOC entry 4274 (class 2604 OID 16510)
-- Name: orcamentos id_orcamento; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos
ALTER COLUMN id_orcamento
SET DEFAULT nextval('public.orcamentos_id_orcamento_seq'::regclass);
--
-- TOC entry 4275 (class 2604 OID 16511)
-- Name: orcamentos id_servico; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos
ALTER COLUMN id_servico
SET DEFAULT nextval('public.orcamentos_id_servico_seq'::regclass);
--
-- TOC entry 4287 (class 2604 OID 16603)
-- Name: orcamentos_contratam_prestadores id; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_contratam_prestadores
ALTER COLUMN id
SET DEFAULT nextval(
        'public.orcamentos_contratam_prestadores_id_seq'::regclass
    );
--
-- TOC entry 4288 (class 2604 OID 16604)
-- Name: orcamentos_contratam_prestadores id_orcamento; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_contratam_prestadores
ALTER COLUMN id_orcamento
SET DEFAULT nextval(
        'public.orcamentos_contratam_prestadores_id_orcamento_seq'::regclass
    );
--
-- TOC entry 4289 (class 2604 OID 16605)
-- Name: orcamentos_contratam_prestadores id_fornecedores; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_contratam_prestadores
ALTER COLUMN id_fornecedores
SET DEFAULT nextval(
        'public.orcamentos_contratam_prestadores_id_fornecedores_seq'::regclass
    );
--
-- TOC entry 4279 (class 2604 OID 16546)
-- Name: orcamentos_tem_insumos id; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_tem_insumos
ALTER COLUMN id
SET DEFAULT nextval('public.orcamentos_tem_insumos_id_seq'::regclass);
--
-- TOC entry 4280 (class 2604 OID 16547)
-- Name: orcamentos_tem_insumos id_orcamento; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_tem_insumos
ALTER COLUMN id_orcamento
SET DEFAULT nextval(
        'public.orcamentos_tem_insumos_id_orcamento_seq'::regclass
    );
--
-- TOC entry 4281 (class 2604 OID 16548)
-- Name: orcamentos_tem_insumos id_insumo; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_tem_insumos
ALTER COLUMN id_insumo
SET DEFAULT nextval(
        'public.orcamentos_tem_insumos_id_insumo_seq'::regclass
    );
--
-- TOC entry 4282 (class 2604 OID 16567)
-- Name: prestadores_servicos id_prestador; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.prestadores_servicos
ALTER COLUMN id_prestador
SET DEFAULT nextval(
        'public.prestadores_servicos_id_prestador_seq'::regclass
    );
--
-- TOC entry 4283 (class 2604 OID 16568)
-- Name: prestadores_servicos id_endereco; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.prestadores_servicos
ALTER COLUMN id_endereco
SET DEFAULT nextval(
        'public.prestadores_servicos_id_endereco_seq'::regclass
    );
--
-- TOC entry 4270 (class 2604 OID 16485)
-- Name: projetos id_projeto; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.projetos
ALTER COLUMN id_projeto
SET DEFAULT nextval('public.projetos_id_projeto_seq'::regclass);
--
-- TOC entry 4271 (class 2604 OID 16486)
-- Name: projetos id_orcamento; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.projetos
ALTER COLUMN id_orcamento
SET DEFAULT nextval('public.projetos_id_orcamento_seq'::regclass);
--
-- TOC entry 4272 (class 2604 OID 16496)
-- Name: servicos id_servico; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.servicos
ALTER COLUMN id_servico
SET DEFAULT nextval('public.servicos_id_servico_seq'::regclass);
--
-- TOC entry 4273 (class 2604 OID 16497)
-- Name: servicos id_cliente; Type: DEFAULT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.servicos
ALTER COLUMN id_cliente
SET DEFAULT nextval('public.servicos_id_cliente_seq'::regclass);
--
-- TOC entry 4291 (class 2606 OID 16459)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.clientes
ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
--
-- TOC entry 4293 (class 2606 OID 16466)
-- Name: enderecos enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.enderecos
ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id_endereco);
--
-- TOC entry 4303 (class 2606 OID 16534)
-- Name: fornecedores fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.fornecedores
ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (id_fornecedor);
--
-- TOC entry 4301 (class 2606 OID 16525)
-- Name: insumos insumos_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.insumos
ADD CONSTRAINT insumos_pkey PRIMARY KEY (id_insumo);
--
-- TOC entry 4309 (class 2606 OID 16586)
-- Name: insumos_tem_fornecedores insumos_tem_fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.insumos_tem_fornecedores
ADD CONSTRAINT insumos_tem_fornecedores_pkey PRIMARY KEY (id_insumo);
--
-- TOC entry 4311 (class 2606 OID 16607)
-- Name: orcamentos_contratam_prestadores orcamentos_contratam_prestadores_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_contratam_prestadores
ADD CONSTRAINT orcamentos_contratam_prestadores_pkey PRIMARY KEY (id);
--
-- TOC entry 4299 (class 2606 OID 16513)
-- Name: orcamentos orcamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos
ADD CONSTRAINT orcamentos_pkey PRIMARY KEY (id_orcamento);
--
-- TOC entry 4305 (class 2606 OID 16550)
-- Name: orcamentos_tem_insumos orcamentos_tem_insumos_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_tem_insumos
ADD CONSTRAINT orcamentos_tem_insumos_pkey PRIMARY KEY (id_orcamento);
--
-- TOC entry 4307 (class 2606 OID 16570)
-- Name: prestadores_servicos prestadores_servicos_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.prestadores_servicos
ADD CONSTRAINT prestadores_servicos_pkey PRIMARY KEY (id_prestador);
--
-- TOC entry 4295 (class 2606 OID 16490)
-- Name: projetos projetos_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.projetos
ADD CONSTRAINT projetos_pkey PRIMARY KEY (id_projeto);
--
-- TOC entry 4297 (class 2606 OID 16499)
-- Name: servicos servicos_pkey; Type: CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.servicos
ADD CONSTRAINT servicos_pkey PRIMARY KEY (id_servico);
--
-- TOC entry 4312 (class 2606 OID 16475)
-- Name: clientes clientes_id_endereco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.clientes
ADD CONSTRAINT clientes_id_endereco_fkey FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id_endereco) NOT VALID;
--
-- TOC entry 4313 (class 2606 OID 16500)
-- Name: servicos id_cliente; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.servicos
ADD CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);
--
-- TOC entry 4315 (class 2606 OID 16535)
-- Name: fornecedores id_endereco; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.fornecedores
ADD CONSTRAINT id_endereco FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id_endereco);
--
-- TOC entry 4318 (class 2606 OID 16571)
-- Name: prestadores_servicos id_endereco; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.prestadores_servicos
ADD CONSTRAINT id_endereco FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id_endereco);
--
-- TOC entry 4319 (class 2606 OID 16592)
-- Name: insumos_tem_fornecedores id_fornecedor; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.insumos_tem_fornecedores
ADD CONSTRAINT id_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES public.fornecedores(id_fornecedor);
--
-- TOC entry 4321 (class 2606 OID 16613)
-- Name: orcamentos_contratam_prestadores id_fornecedor; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_contratam_prestadores
ADD CONSTRAINT id_fornecedor FOREIGN KEY (id_fornecedores) REFERENCES public.fornecedores(id_fornecedor);
--
-- TOC entry 4316 (class 2606 OID 16556)
-- Name: orcamentos_tem_insumos id_insumo; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_tem_insumos
ADD CONSTRAINT id_insumo FOREIGN KEY (id_insumo) REFERENCES public.insumos(id_insumo);
--
-- TOC entry 4320 (class 2606 OID 16587)
-- Name: insumos_tem_fornecedores id_insumo; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.insumos_tem_fornecedores
ADD CONSTRAINT id_insumo FOREIGN KEY (id_insumo) REFERENCES public.insumos(id_insumo);
--
-- TOC entry 4317 (class 2606 OID 16551)
-- Name: orcamentos_tem_insumos id_orcamento; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_tem_insumos
ADD CONSTRAINT id_orcamento FOREIGN KEY (id_orcamento) REFERENCES public.orcamentos(id_orcamento);
--
-- TOC entry 4322 (class 2606 OID 16608)
-- Name: orcamentos_contratam_prestadores id_orcamento; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos_contratam_prestadores
ADD CONSTRAINT id_orcamento FOREIGN KEY (id_orcamento) REFERENCES public.orcamentos(id_orcamento);
--
-- TOC entry 4314 (class 2606 OID 16514)
-- Name: orcamentos id_servico; Type: FK CONSTRAINT; Schema: public; Owner: ademir_serralheria
--

ALTER TABLE ONLY public.orcamentos
ADD CONSTRAINT id_servico FOREIGN KEY (id_servico) REFERENCES public.servicos(id_servico);
-- Completed on 2023-05-31 14:55:39 -03
--
-- ademir_serralheriaQL database dump complete
--