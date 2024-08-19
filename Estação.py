import os
import subprocess
import sys
import ctypes

# Função para verificar se o script está sendo executado como administrador
def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False

# Se o script não estiver sendo executado como administrador, reinicie com permissões elevadas
if not is_admin():
    print("O script precisa ser executado como administrador.")
    # Reexecuta o script com privilégios de administrador
    ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, ' '.join([sys.executable] + sys.argv), None, 1)
    sys.exit()

# Define os diretórios e pastas a serem verificados
directories = ["C:\\Equipexe", "C:\\Temp", "C:\\temporario", "L:\\Equipexe", "L\\Temp", "L:\\temporario"]

# Função para criar a pasta se ela não existir
def create_folder_if_not_exists(folder_path):
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)
        print(f"Pasta {folder_path} criada.")
    else:
        print(f"Pasta {folder_path} já existe.")

# Função para compartilhar a pasta com permissões totais
def share_folder(folder_path):
    share_name = os.path.basename(folder_path)
    share_command = f'net share {share_name}="{folder_path}" /GRANT:Everyone,FULL'
    result = subprocess.run(share_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    if result.returncode == 0:
        print(f"Pasta {folder_path} compartilhada com sucesso.")
    else:
        print(f"Erro ao compartilhar a pasta {folder_path}: {result.stderr.decode()}")

# Verifica e cria as pastas nos diretórios C e L, e compartilha as pastas
for directory in directories:
    create_folder_if_not_exists(directory)
    share_folder(directory)

print("Script concluído.")