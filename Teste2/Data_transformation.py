import pdfplumber
import csv
import os
import zipfile

#Define o diretório de trabalho como o diretório onde o script está localizado
script_dir = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_dir)

PDF_FILE = "Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"  # Nome do arquivo PDF
CSV_FILE = "Rol_de_Procedimentos.csv"  # Nome do arquivo CSV
ZIP_FILE = "Teste_HarrysonCMartins.zip"  # Nome do arquivo ZIP


ABREVIACOES = {
    "OD": "Seg_Odontologica",
    "AMB": "Seg_Ambulatorial"
}

# Mapeamento dos nomes das colunas
COLUMN_NAMES = {
    "PROCEDIMENTO": "procedimento",
    "RN (alteração)": "rn",
    "VIGÊNCIA": "vigencia",
    "OD": "seg_odontologica",
    "AMB": "seg_ambulatorial",
    "HCO": "hco",
    "HSO": "hso",
    "REF": "ref",
    "PAC": "pac",
    "DUT": "dut",
    "SUBGRUPO": "subgrupo",
    "GRUPO": "grupo",
    "CAPÍTULO": "capitulo"
}

def extract_table_from_pdf(pdf_file):
    data = []
    header = None
    
    with pdfplumber.open(pdf_file) as pdf:
        for page in pdf.pages:
            tables = page.extract_tables()
            for table in tables:
                for i, row in enumerate(table):
                    if row and any(cell.strip() for cell in row if cell):
                        # Processar o primeiro cabeçalho encontrado
                        if header is None and "PROCEDIMENTO" in [cell.strip() if cell else "" for cell in row]:
                            header = [COLUMN_NAMES.get(cell.strip(), cell.strip().lower()) if cell else "" for cell in row]
                            data.append(header)
                        # Para as demais linhas, verificar se não é um cabeçalho duplicado
                        elif header is not None and not "PROCEDIMENTO" in [cell.strip() if cell else "" for cell in row]:
                            clean_row = [ABREVIACOES.get(cell.strip(), cell.strip()) if cell else "" for cell in row]
                            data.append(clean_row)
    
    return data

def save_to_csv(data, csv_file):
    with open(csv_file, mode="w", newline="", encoding="utf-8") as file:
        writer = csv.writer(file)
        
        # Verificar se há dados antes de escrever
        if data:
            # Escrever cabeçalho assumindo que a primeira linha contém os títulos
            writer.writerow(data[0])
            
            # Escrever as demais linhas
            for row in data[1:]:
                writer.writerow(row)
    print(f"Arquivo CSV salvo: {csv_file}")


# testeee
# cpmpactação
def compress_to_zip(csv_file, zip_file):
    with zipfile.ZipFile(zip_file, "w", zipfile.ZIP_DEFLATED) as zipf:
        zipf.write(csv_file, os.path.basename(csv_file))
    print(f"Arquivo ZIP criado: {zip_file}")

if __name__ == "__main__":
    print("Extraindo dados do PDF...")
    extracted_data = extract_table_from_pdf(PDF_FILE)
    
    print("Salvando dados em CSV...")
    save_to_csv(extracted_data, CSV_FILE)
    
    print("Compactando CSV em ZIP...")
    compress_to_zip(CSV_FILE, ZIP_FILE)
    
    print("Processo concluído!")
