import random
import string
import concurrent.futures
import os
import sys

# Caracteres permitidos na senha
valid_chars = string.ascii_letters + string.digits + "!@#$%&*"

# Configurações de regras da senha XOR
REGRAS = {
    'usa_minusculas': True,
    'usa_maiusculas': True,
    'usa_digitos': True,
    'usa_simbolos': True,
}

xor_key = 0x0F

# Função para validar a senha XOR de acordo com as regras
def contem_regras(s, senha):
    # print("Senha: ", senha, "Hex senha: ", convert_hex(senha).capitalize(), "XOR: ", s, "Hex XOR: ", convert_hex(s).capitalize())

    if REGRAS['usa_minusculas'] and not any(c in string.ascii_lowercase for c in s):
        return False
    if REGRAS['usa_maiusculas'] and not any(c in string.ascii_uppercase for c in s):
        return False
    if REGRAS['usa_digitos'] and not any(c in string.digits for c in s):
        return False
    if REGRAS['usa_simbolos'] and not any(c in "!@#$%&*" for c in s):
        return False
    return True

# Converte em hexadecimal
def convert_hex(s):
    return ''.join(hex(ord(c))[2:].zfill(2) for c in s)

# Aplica XOR na string, retorna string XOR e hex
def aplicar_xor(s, key=xor_key):
    xor_chars = []
    for c in s:
        xor_val = ord(c) ^ key
        xor_char = chr(xor_val)
        xor_chars.append(xor_char)
    xor_str = ''.join(xor_chars)
    return xor_str

# Gera e valida senha
def tentar_gerar_valida():
    for _ in range(10000):
        senha = ''.join(random.choice(valid_chars) for _ in range(12))
        xor_chars = []
        for c in senha:
            xor_val = ord(c) ^ xor_key
            xor_char = chr(xor_val)
            if xor_char not in valid_chars:
                break
            xor_chars.append(xor_char)
        else:
            senha_xor = ''.join(xor_chars)
            if contem_regras(senha_xor, senha):
                return senha, senha_xor
    return None

# Executa tarefas em paralelo até encontrar resultado válido
def encontrar_senha():
    with concurrent.futures.ProcessPoolExecutor(max_workers=os.cpu_count()) as executor:
        futures = []
        while True:
            for _ in range(os.cpu_count()):
                futures.append(executor.submit(tentar_gerar_valida))
            for future in concurrent.futures.as_completed(futures):
                resultado = future.result()
                if resultado:
                    senha, senha_xor = resultado
                    print("Senha: ", senha, "Hex senha: ", convert_hex(senha).upper(), "XOR: ", senha_xor, "Hex XOR: ", convert_hex(senha_xor).upper())
                    executor.shutdown(cancel_futures=True)
                    return
            futures.clear()

if __name__ == "__main__":
    if len(sys.argv) > 1:
        senha_entrada = sys.argv[1]
        senha_xor = aplicar_xor(senha_entrada, xor_key)
        print("Senha entrada :", senha_entrada)
        print("XOR aplicado  :", senha_xor)
        print("Hex entrada   :", convert_hex(senha_entrada).upper())
        print("Hex XOR      :", convert_hex(senha_xor).upper())
    else:
        encontrar_senha()
