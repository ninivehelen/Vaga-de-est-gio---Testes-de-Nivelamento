from shutil import make_archive
import urllib
import os

def salvar_pdf(pasta, url, nome_arquivo):
    if not os.path.exists(pasta):
        os.makedirs(pasta)

    # Caminho completo para salvar o arquivo
    caminho_completo = os.path.join(pasta, nome_arquivo)
    
    # Baixando e salvando o PDF
    urllib.request.urlretrieve(url, caminho_completo)
    print(f"Arquivo {nome_arquivo} salvo em {pasta}")

    # compactar os arquivos 
    make_archive('anexos_compactados', 'zip', 'anexos')

def compacta_pasta(pasta, nome_pasta_compactada,):
    if not os.path.exists(pasta):
        os.makedirs(pasta)
    
    # compactar os arquivos 
    make_archive(nome_pasta_compactada, 'zip', pasta)