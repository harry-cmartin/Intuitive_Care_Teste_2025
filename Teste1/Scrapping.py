import requests
from bs4 import BeautifulSoup
import os
import zipfile
from urllib.parse import urljoin
import logging
import hashlib


#Define o diretório de trabalho como o diretório onde o script está localizado
script_dir = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_dir)


# Configuração do logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('scraping.log'),
        logging.StreamHandler()
    ]
)




# URL da página
URL = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
DOWNLOAD_DIR = "Downloads"
ZIP_FILENAME = "anexos_ans.zip"

# Criar pasta de downloads se não existir
os.makedirs(DOWNLOAD_DIR, exist_ok=True)

def get_pdf_links():
    try:
        response = requests.get(URL, timeout=30)
        response.raise_for_status()
        
        soup = BeautifulSoup(response.text, "html.parser")
        pdf_links = []
        
        for link in soup.find_all("a", href=True):
            href = link["href"]
            if href.endswith(".pdf") and ("Anexo_I" in href or "Anexo_II" in href):
                full_url = urljoin(URL, href)
                pdf_links.append(full_url)
        
        if not pdf_links:
            logging.warning("Nenhum anexo encontrado!")
        else:
            logging.info(f"Encontrados {len(pdf_links)} links de anexos")
            for link in pdf_links:
                logging.debug(f"Link encontrado: {link}")
        
        return pdf_links
    except requests.RequestException as e:
        logging.error(f"Erro ao acessar a página: {str(e)}")
        return []

def verify_file_integrity(filename):
    try:
        with open(filename, 'rb') as file:
            # Verifica se o arquivo é um PDF válido
            header = file.read(4)
            return header.startswith(b'%PDF')
    except Exception as e:
        logging.error(f"Erro ao verificar integridade do arquivo {filename}: {str(e)}")
        return False

def download_pdfs(pdf_links):
    downloaded_files = []
    for link in pdf_links:
        filename = os.path.join(DOWNLOAD_DIR, os.path.basename(link))
        
        try:
            logging.info(f"Baixando {filename}...")
            response = requests.get(link, timeout=30)
            response.raise_for_status()
            
            with open(filename, "wb") as file:
                file.write(response.content)
            
            if verify_file_integrity(filename):
                downloaded_files.append(filename)
                logging.info(f"Arquivo {filename} baixado com sucesso")
            else:
                logging.error(f"Arquivo {filename} corrompido ou inválido")
                os.remove(filename)
                
        except requests.RequestException as e:
            logging.error(f"Erro ao baixar {filename}: {str(e)}")
        except IOError as e:
            logging.error(f"Erro ao salvar {filename}: {str(e)}")
    
    return downloaded_files

def create_zip(file_list):
    try:
        with zipfile.ZipFile(ZIP_FILENAME, "w") as zipf:
            for file in file_list:
                zipf.write(file, os.path.basename(file))
        logging.info(f"Arquivo ZIP criado: {ZIP_FILENAME}")
    except Exception as e:
        logging.error(f"Erro ao criar arquivo ZIP: {str(e)}")

if __name__ == "__main__":
    logging.info("Iniciando processo de scraping")
    pdf_links = get_pdf_links()
    
    if pdf_links:
        files = download_pdfs(pdf_links)
        if files:
            create_zip(files)
            logging.info("Processo concluído com sucesso!")
        else:
            logging.error("Nenhum arquivo foi baixado")
    else:
        logging.error("Não foi possível obter os links dos PDFs")