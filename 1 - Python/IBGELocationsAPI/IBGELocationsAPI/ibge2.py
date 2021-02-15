import requests
import pathlib
import json
import codecs

file = r'C:\Projetos\Teste Técnico Quero\1 - Python\apidatafrompython.json'
url = 'https://servicodados.ibge.gov.br/api/v1/localidades/distritos'
try:
    response = requests.get(url)
    response.raise_for_status()

    apidata = requests.get(url).json()    
    with codecs.open(file, 'w', encoding='utf-8') as f:
        json.dump(apidata, f, ensure_ascii=False)

except requests.exceptions.RequestException as err:
    print ("Opa, algo deu errado por aqui!",err)
except requests.exceptions.HTTPError as errh:
    print ("Erro HTTP:",errh)
except requests.exceptions.ConnectionError as errc:
    print ("Erro de Conexao:",errc)
except requests.exceptions.Timeout as errt:
    print ("Erro de Timeout:",errt) 
   
