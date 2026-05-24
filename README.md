# Repositório do Banco de Dados

Repositório responsável por:
- estrutura do banco PostgreSQL
- configuração Docker do banco
- scripts SQL de inicialização
- arquivos de modelagem do banco

---

# Estrutura do Projeto

```text
project-root/
│
├── docker/
│   └── docker-compose.yaml
│
├── Modelagem/
│
└── SQL/
    ├── 01-CREATE-TABLES.sql
    └── 02-INSERTS-TESTE.sql
```

---

# Descrição das Pastas

## docker/

Contém a configuração Docker utilizada para inicializar e executar o container PostgreSQL.

### docker-compose.yaml

Responsável por:
- criar o container PostgreSQL
- configurar portas
- definir credenciais do banco
- montar os scripts SQL de inicialização
- persistir os dados do banco

---

## Modelagem/

Contém os arquivos relacionados à modelagem do banco de dados.

---

## SQL/

Contém os scripts SQL executados automaticamente durante a inicialização do banco.

Os scripts são executados em ordem alfabética. Assim, os nomes iniciam pelo número de execução (01, 02, ...).

### 01-CREATE-TABLES.sql

Responsável por:
- criação das tabelas
- constraints
- chaves estrangeiras

---

### 02-INSERTS-TESTE.sql

Responsável por:
- inserção de dados de teste
- população inicial do banco

---

# Configuração Docker

Arquivo:

```text
docker/docker-compose.yaml
```

Configuração atual:

```yaml
services:
  postgres:
    image: postgres:17
    container_name: postgres-dev

    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: 1234
      POSTGRES_DB: DB-OLIMPIA

    ports:
      - "5433:5432"

    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ../SQL:/docker-entrypoint-initdb.d

volumes:
  postgres_data:
```

---

# Configuração de Porta

```yaml
"5433:5432"
```

Mapeia:
- porta local `5433`
para:
- porta `5432` do PostgreSQL dentro do container

Exemplo de conexão:

| Campo | Valor |
|---|---|
| Host | localhost |
| Porta | 5433 |
| Banco | DB-OLIMPIA |
| Usuário | postgres |
| Senha | 1234 |

---

# Executando o Banco

Dentro da pasta `docker/`:

## Iniciar container

```bash
docker compose up -d
```

---

## Parar container

```bash
docker compose down
```

---

## Recriar completamente o banco

```bash
docker compose down -v
docker compose up -d
```

O parâmetro `-v` remove o volume persistente do PostgreSQL e força a execução novamente dos scripts SQL.

---

# Inicialização Automática dos Scripts SQL

O volume:

```yaml
- ../SQL:/docker-entrypoint-initdb.d
```

faz com que o PostgreSQL execute automaticamente os scripts SQL durante a primeira inicialização do banco.

Ordem de execução:

```text
01-CREATE-TABLES.sql
02-INSERTS-TESTE.sql
```

---

# Observação Importante

Os scripts SQL de inicialização são executados apenas quando o volume do PostgreSQL está vazio.

Se o banco já existir, o PostgreSQL NÃO executará novamente os scripts automaticamente.

Para forçar a reinicialização:

```bash
docker compose down -v
docker compose up -d
```