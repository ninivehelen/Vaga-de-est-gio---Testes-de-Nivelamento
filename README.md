# Teste de Nivelamento v.250321

Este é um teste de nivelamento para uma vaga de estágio na área de Desenvolvimento na Intuitive Care.

## Passos para Rodar o Projeto

### 1. Clonar o Repositório
Primeiro, clone este repositório para acessar os arquivos do projeto.

### 2. Abrir o Projeto
Abra o projeto em sua IDE após o clone.

### 3. Rodar o Arquivo `scraping.py`
- Dentro do projeto, existe um arquivo chamado `scraping.py`. Execute este arquivo para extrair dois PDFs do seguinte link:
  - [https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos](https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos)
- Após rodar o script, os PDFs serão baixados, salvos em uma pasta e, em seguida, compactados em um arquivo ZIP chamado `anexos_compactados.zip`.

### 4. Rodar a Função `baixar_tabela`
- Após o procedimento acima, o script chamará a função `baixar_tabela`, que está no arquivo `extracao_pdf.py`.
- Esta função fará o download das tabelas do primeiro PDF, converterá para arquivos CSV, salvará em uma pasta e, depois, compactará a pasta em um arquivo ZIP chamado `teste_ninive.zip`.
  - **Nota**: O nome do arquivo ZIP deve seguir o formato `teste_{seunome}.zip`, conforme solicitado.

### 5. Rodar o Script SQL
- Após os passos anteriores, será gerado um script chamado `script.sql`. Este script precisa ser rodado separadamente dos outros passos e é responsável por criar as tabelas no banco de dados para os arquivos baixados.
- Os arquivos estão disponíveis nos seguintes links:
  - [https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/](https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/)
  - [https://dadosabertos.ans.gov.br/FTP/PDA/operadoras_de_plano_de_saude_ativas/](https://dadosabertos.ans.gov.br/FTP/PDA/operadoras_de_plano_de_saude_ativas/)

#### Tratamento de Dados
Como o primeiro link contém valores com vírgulas (`,`), o que não é compatível com o banco de dados (que espera pontos (`.`)), foi criado um script chamado `tratar_os_csv.py` para realizar essa transformação. Os dados processados estão dentro de uma pasta chamada `arquivos`, que está dentro da pasta `sql`. **Não há necessidade de rodar este script, a menos que novos arquivos precisem de tratamento.**

### 6. Criar o Banco de Dados e Carregar os Dados
- Após realizar os passos anteriores, será necessário criar o banco de dados e carregar os dados nas tabelas.
- Foram criadas duas tabelas: `operadoras_plano_saude` e `demonstracoes_contabeis`.
- Para configurar o banco de dados, é necessário ter o PostgreSQL instalado na sua máquina. Após a instalação do PostgreSQL e configuração das variáveis de ambiente, siga os passos abaixo:

#### Passos:
```
1. Abra o terminal e rode o seguinte comando:

   psql -U postgres 

2. Após acessar o PostgreSQL, execute o comando abaixo para rodar o script de criação do banco de dados:

\i 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/script.sql'

Substitua o caminho original ('C:/Users/niniv/OneDrive/Documentos/intuitive/sql/script.sql') pelo  pelo caminho correto da sua máquina.

Exemplo; \i 'C:/Users/seu_usuario/Documentos/projeto/sql/script.sql'

Dentro do script.sql precisa também mudar o caminho de todos os arquivos pelo original da sua maquina, la esta assim: 
 \copy demonstracoes_contabeis (data_operadora, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:/Users/niniv/OneDrive/Documentos/intuitive/sql/arquivos/4T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

troque o caminho de todos que tem esse código pelo original da sua maqui correspondente a cada arquivo o os do 1T2023 todos e o do Relatorio_cadop

Exemplo: \copy demonstracoes_contabeis (data_operadora, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) 
FROM 'C:/Users/seu_usuario/Documentos/projeto/sql/arquivos/4T2024.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

Aguarde até que as tabelas sejam criadas e os dados dos arquivos sejam inseridos nas respectivas tabelas.

3. Rodar Consultas SQL
Duas consultas SQL foram fornecidas para análise de dados. Elas estão localizadas dentro da pasta sql, no arquivo chamado sql.txt.

Após completar a configuração do banco de dados e o carregamento dos dados, abra o banco de dados e execute as consultas para obter os resultados.
``` 

## Observações Importantes
O tabula, usado para extrair as tabelas do primeiro PDF, requer o Java para funcionar corretamente. Certifique-se de ter o Java instalado em sua máquina.

- **PostgreSQL**: Para rodar o banco de dados.
- **Java**: O Tabula, usado para extrair as tabelas do primeiro PDF, requer o Java para funcionar corretamente.
- **Bibliotecas**: Pandas, Tabula, BeautifulSoup (bs4), Requests e Glob. Elas são necessárias para rodar o código Python de extração de dados.
