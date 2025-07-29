#!/bin/bash

# Função para executar o comando e guardar o PID do processo
run_command() {
    { eval "$1" & } &
    pid=$!
    pids+=($pid)
}

# Função para obter o nome do pod
get_pod_name() {
    pod_name=$(kubectl get pods -n "$1" | grep "$2" | awk '{print $1}' | head -n 1)
    echo $pod_name
}

# Verifica se ao menos 2 argumentos foram passados
if [ $# -lt 2 ]; then
    echo "Uso: bash run-port-forward.sh [qa|prod] [serviço1] [serviço2] ..."
    exit 1
fi

# Ambiente (qa ou prod)
ENV=$1
shift

# Array para armazenar os PIDs dos processos
pids=()

# Definir comandos de acordo com o ambiente
declare -A services

if [ "$ENV" == "qa" ]; then
    services=(
        ["kafka"]="kubectl port-forward --namespace external kafka-mmp5-qa-0 9092:9092"
        ["elastic"]="kubectl port-forward --namespace elastic-qa services/eck-mmp5-qa-es-http 9200:9200"
        ["postgres"]="kubectl port-forward --namespace pgbouncer-qa \$(get_pod_name pgbouncer-qa pgbouncer) 5432:5432"
        ["redis"]="kubectl port-forward --namespace external \$(get_pod_name external redis-qa) 6379:6379"
        ["mongo"]="kubectl port-forward --namespace external \$(get_pod_name external mongodb-qa) 27017:27017"
    )
elif [ "$ENV" == "prod" ]; then
    services=(
        ["kafka"]="kubectl port-forward --namespace external kafka-mmp5-prod-0 9092:9092"
        ["elastic"]="kubectl port-forward --namespace mmp5-prod services/eck-mmp5-prod-es-http 9200:9200"
        ["postgres"]="kubectl port-forward --namespace pgbouncer-prod \$(get_pod_name pgbouncer-prod pgbouncer) 5432:5432"
        ["redis"]="kubectl port-forward --namespace external \$(get_pod_name external redis-prod) 6379:6379"
        ["mongo"]="kubectl port-forward --namespace external \$(get_pod_name external mongodb-prod) 27017:27017"
    )
else
    echo "Ambiente inválido: $ENV. Use 'qa' ou 'prod'."
    exit 1
fi

# Executa os comandos de port-forward para os serviços especificados
for service in "$@"; do
    if [[ -v services[$service] ]]; then
        run_command "${services[$service]}"
    else
        echo "Serviço desconhecido: $service"
    fi
done

# Loop infinito para manter o script em execução
while true; do
    sleep 1
done

# Aguarda os processos terminarem
trap 'kill ${pids[*]}' SIGINT
wait
