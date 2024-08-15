import os
import customtkinter as ctk

def execute_batch_file(file_path):
    os.system(f'start /wait {file_path}')

def create_buttons():
    batch_files = [f for f in os.listdir() if os.path.isfile(f) and f.endswith(".bat")]

    # Cria os botões em quatro fileiras de quatro
    num_rows = (len(batch_files) + 3) // 4
    num_cols = 4
    for i in range(num_rows):
        row_buttons = []
        for j in range(num_cols):
            if i*num_cols + j < len(batch_files):
                file = batch_files[i*num_cols + j]
                file_name = os.path.splitext(file)[0]
                button = ctk.CTkButton(root, text=file_name.upper(), command=lambda file=file: execute_batch_file(file))
                button.grid(row=i, column=j, padx=7, pady=3)
                row_buttons.append(button)

        # Adiciona um espaço em branco abaixo da fileira de botões
        if i < num_rows-1:
            ctk.CTkLabel(root, text="").grid(row=i+1, column=0, columnspan=num_cols, pady=5)

    # Calcula o tamanho da tela de acordo com a quantidade de botões
    root.geometry(f"{num_cols * 120}x{num_rows * 50 + 100}")

root = ctk.CTk()
root.title("Batch File Executor")

# Cria os botões dos arquivos .bat
create_buttons()

# Remove o botão "MENU"
root.grid_rowconfigure(0, minsize=0, weight=0)
root.grid_columnconfigure(0, minsize=0, weight=0)

# Define o tamanho máximo da janela
root.grid_columnconfigure(1, minsize=120, weight=1)
root.grid_columnconfigure(2, minsize=120, weight=1)
root.grid_columnconfigure(3, minsize=120, weight=1)

root.mainloop()