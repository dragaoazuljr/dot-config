#!/bin/bash

# Função para executar o comando e guardar o PID do processo
run_command() {
    { eval "$1" & } &
    pid=$!
    pids+=($pid)
}

# Função para obter o nome do pod
get_pod_name() {
    pod_name=$(kubectl get pods -n $1 | grep $2 | awk '{print $1}')
    echo $pod_name
}

# Array para armazenar os PIDs dos processos
pids=()

# Mapear serviços para seus respectivos comandos de port-forward
declare -A services
services=(
    ["kafka"]="kubectl port-forward --namespace external kafka-mmp5-qa-0 9092:9092"
    ["elastic"]="kubectl port-forward --namespace elastic-qa services/eck-mmp5-qa-es-http 9200:9200"
    ["postgres"]="kubectl port-forward --namespace external \$(get_pod_name external postgres-qa) 5432:5432"
    ["redis"]="kubectl port-forward --namespace external \$(get_pod_name external redis-qa) 6379:6379"
)

# Verificar se pelo menos um serviço foi passado como argumento
if [ $# -eq 0 ]; then
    echo "Nenhum serviço especificado. Utilize: bash run-port-foward.sh kafka elastic postgres redis"
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
