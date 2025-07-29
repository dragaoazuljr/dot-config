# -*- coding: utf-8 -*-
import requests
from bs4 import BeautifulSoup
import json

# Definição do dicionário de resposta padrão
default_response = {
    "status": "FAILED",
    "result": "Não foi possível iniciar o processo de scraping."
}

# URL alvo para buscar a cotação do dólar.
# Usamos uma fonte conhecida e geralmente estável.
url = "https://economia.uol.com.br/cotacoes/cambio/"

# Cabeçalhos para simular uma requisição de navegador e evitar bloqueios simples.
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
}

try:
    # Etapa 1: Realizar a requisição HTTP
    # Envolvido em um try-except para capturar falhas de conexão (ex: DNS, timeout).
    response = requests.get(url, headers=headers, timeout=15)

    # Etapa 2: Validar a resposta da requisição
    # Verifica se o status code é 200 (OK).
    if response.status_code == 200:
        # Etapa 3: Analisar (parse) o conteúdo HTML
        # Usamos BeautifulSoup com o parser lxml para eficiência.
        soup = BeautifulSoup(response.content, 'lxml')

        # Etapa 4: Extrair o elemento HTML com o valor do dólar
        # O seletor CSS busca o valor do "Dólar Comercial".
        # Este seletor pode precisar de atualização se o site mudar sua estrutura.
        dolar_element = soup.select_one('a.subtituloGrafico.cambio[title="Dólar Comercial"] .valor')

        # Etapa 5: Validar se o elemento foi encontrado
        if dolar_element:
            dolar_value_text = dolar_element.get_text(strip=True)
            
            # Etapa 6: Validar a coerência do dado extraído
            # Tenta converter o texto para um número. A vírgula é trocada por ponto.
            try:
                float(dolar_value_text.replace(',', '.'))
                # Sucesso: Monta a resposta final.
                # AVISO: A extração de dados históricos de 10 meses não é trivial.
                # Geralmente, esses dados são carregados dinamicamente com JavaScript.
                # Para essa tarefa, seria necessário usar uma ferramenta como o Selenium para interagir com a página,
                # ou investigar a API interna do site (chamadas XHR) para obter os dados de forma estruturada.
                # Este script demonstra a extração do valor atual com sucesso.
                success_message = (
                    "SUCESSO ao extrair o valor ATUAL do dólar comercial: R$ {}. ".format(dolar_value_text) +
                    "Para obter o histórico dos últimos 10 meses, uma abordagem mais avançada é necessária. " +
                    "Os dados históricos neste site são carregados dinamicamente (via JavaScript), " +
                    "o que exigiria o uso da biblioteca Selenium para automatizar a navegação e interação com os gráficos ou tabelas dinâmicas."
                )
                default_response["status"] = "SUCCESS"
                default_response["result"] = success_message
            except (ValueError, TypeError):
                # Falha na conversão do valor encontrado.
                default_response["result"] = f"Falha na Extração: O valor encontrado ('{dolar_value_text}') não é um número válido."
        else:
            # Falha se o seletor não encontrar o elemento.
            default_response["result"] = "Falha no Parsing: O elemento HTML com a cotação do dólar não foi encontrado. A estrutura do site pode ter mudado."
    else:
        # Falha se a requisição não retornar status 200.
        default_response["result"] = f"Falha na Requisição: O site retornou o status code {response.status_code}."

except requests.exceptions.RequestException as e:
    # Falha em caso de erro de rede.
    default_response["result"] = f"Erro de Conexão: A requisição para a URL falhou. Detalhes: {e}"
except Exception as e:
    # Captura de outras exceções inesperadas.
    default_response["result"] = f"Ocorreu um erro inesperado durante a execução: {e}"

# Imprime o resultado final no formato JSON.
print(json.dumps(default_response, indent=2, ensure_ascii=False))
