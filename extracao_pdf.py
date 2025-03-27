import tabula
import pandas as pd
from tabula import read_pdf
from salvar_arquivos import compacta_pasta

#Caminha do pdf que tem as tabelas para serem extraídas. 
caminho_pdf = ("anexos/Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf")

def baixar_tabela():
    #Data frame vazio para salvar as tabelas 
    df_final_tabela = pd.DataFrame()
    
    #Baixando as tabelas 
    print('Baixando tabelas...')
    tabelas = read_pdf(caminho_pdf, pages='all')
    for tabela in tabelas:
        print(tabela)
        df_temp = pd.DataFrame(tabela)
        df_final_tabela = pd.concat([df_final_tabela,df_temp])
    #Renomeando as colunas como solicitado
    df_final_tabela = df_final_tabela[['PROCEDIMENTO', 'RN\r(alteração)', 'VIGÊNCIA', 'OD', 'AMB', 'HCO', 'HSO', 'REF', 'PAC', 'DUT', 'SUBGRUPO', 'GRUPO', 'CAPÍTULO']]    
    df_final_tabela = df_final_tabela.rename(columns={'RN\r(alteração)': 'RN(aleração)','OD': 'Seg. Odontológica', 'AMB': 'Seg. Ambulatorial'})   
    df_final_tabela.replace('', pd.NA, inplace=True)
    df_final_tabela.dropna(how='all', inplace=True) 
    print('Tabelas baixadas')
    df_final_tabela.to_csv('tabela_rol_procedimento.csv',sep=';', encoding= 'utf-8-sig', index=False)
    print('csv das tabelas salvo')
    compacta_pasta('Teste_ninive', 'Teste_ninive')




