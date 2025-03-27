import pandas as pd
import glob

#Este script foi criado para tratar os arquivos csv, pois as coluns com valores tem (,) e o banco de dados aceita só aceita (.)
# É para ser rodado somente uma vez quando estiver com os arquivos para o banco de dados, pois depois os arquivos já estaram tradados ao terminar esse script
# Os arquivo da pasta arquivos são tratado e salvos substituindo os não tratados

# Definir o caminho para os arquivos CSV
caminho = 'sql/arquivos/*.csv'
todos_arquivos = glob.glob(caminho)
print(todos_arquivos)

def tratar_arquivos_csv():
    print("Arquivos encontrados:", todos_arquivos)
    for arquivo in todos_arquivos:
        df = pd.read_csv(arquivo, delimiter=';')
        df['VL_SALDO_INICIAL'] = df['VL_SALDO_INICIAL'].str.replace(',', '.').astype(float)
        df['VL_SALDO_FINAL'] = df['VL_SALDO_FINAL'].str.replace(',', '.').astype(float)
        df.to_csv(f'{arquivo}', index=False, sep=';')
        print('arquivos salvos')

if __name__ == "__main__":
     tratar_arquivos_csv()
     
