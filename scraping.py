from salvar_arquivos import salvar_pdf
from extracao_pdf import baixar_tabela
import requests

# Biblioteca para fazer a requisição da pagina
from bs4 import BeautifulSoup
# Biblioteca para manipular e selecionar dados do html

def acessar_link():
    pagina = requests.get(
        "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos")
    # Requisição na pagina Inicial
    content = pagina.content
    site = BeautifulSoup(content, "html.parser")
    
    #Pecorendo a lista ol, pois os links dos dois PDF estão nelas
    for link in site.ol:
        arquivo = link.a['href']
        # print(arquivo)
        nome_arquivo = arquivo.split("/")
        nome_arquivo = nome_arquivo[8]
        #salvando e compactando os dois pdf baixados 
        salvar_pdf('anexos', arquivo,  nome_arquivo)

if __name__ == "__main__":
      acessar_link()
      baixar_tabela()

      