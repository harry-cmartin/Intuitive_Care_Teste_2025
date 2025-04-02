import requests
from bs4 import BeautifulSoup
import os
import zipfile
from urllib.parse import urljoin

# URL da página
URL = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
DOWNLOAD_DIR = "Downloads"
ZIP_FILENAME = "anexos_ans.zip"

# Criar pasta de downloads se não existir
os.makedirs(DOWNLOAD_DIR, exist_ok=True)

def get_pdf_links():
    response = requests.get(URL)
    response.raise_for_status()
    
    soup = BeautifulSoup(response.text, "html.parser")
    pdf_links = []
    
    for link in soup.find_all("a", href=True):
        href = link["href"]
        if href.endswith(".pdf") and ("Anexo_I" in href or "Anexo_II" in href):
            full_url = urljoin(URL, href)  # Resolve URLs relativas
            pdf_links.append(full_url)
    
    if not pdf_links:
        print("Nenhum anexo encontrado! ")
    else:
        print("Links encontrados:")
        for link in pdf_links:
            print(link)
    
    return pdf_links

def download_pdfs(pdf_links):
    downloaded_files = []
    for link in pdf_links:
        filename = os.path.join(DOWNLOAD_DIR, os.path.basename(link))
        
        print(f"Baixando {filename}...")
        response = requests.get(link)
        response.raise_for_status()
        
        with open(filename, "wb") as file:
            file.write(response.content)
        
        downloaded_files.append(filename)
    
    return downloaded_files

def create_zip(file_list):
    with zipfile.ZipFile(ZIP_FILENAME, "w") as zipf:
        for file in file_list:
            zipf.write(file, os.path.basename(file))
    print(f"Arquivo ZIP criado: {ZIP_FILENAME}")

if __name__ == "__main__":
    print("Buscando links dos PDFs...")
    pdf_links = get_pdf_links()
    
    if pdf_links:
        print("Baixando PDFs...")
        files = download_pdfs(pdf_links)
        print("Criando arquivo ZIP...")
        create_zip(files)
        print("Processo concluído!")