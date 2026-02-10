#!/bin/bash

# ================================
#        GhosterEncripter
#  Local & External HTML Launcher
# ================================

# Colores
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RESET="\e[0m"

clear

# Banner
echo -e "${CYAN}"
echo "   ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗███████╗██████╗ "
echo "  ██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗"
echo "  ██║  ███╗███████║██║   ██║███████╗   ██║   █████╗  ██████╔╝"
echo "  ██║   ██║██╔══██║██║   ██║╚════██║   ██║   ██╔══╝  ██╔══██╗"
echo "  ╚██████╔╝██║  ██║╚██████╔╝███████║   ██║   ███████╗██║  ██║"
echo "   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝"
echo "              👻 GhosterEncripter 👻"
echo -e "${RESET}"
echo

# Verificar index.html
if [ ! -f "index.html" ]; then
    echo -e "${RED}[!] index.html no encontrado en el directorio actual${RESET}"
    exit 1
fi

# Detectar IP local
LOCAL_IP=$(ip route get 1 | awk '{print $7}' | head -n 1)

# Elegir puerto
read -p "Puerto a usar (default 8000): " PORT
PORT=${PORT:-8000}

echo
echo -e "${YELLOW}IP local detectada:${RESET} ${GREEN}$LOCAL_IP${RESET}"
echo -e "${YELLOW}Puerto seleccionado:${RESET} ${GREEN}$PORT${RESET}"
echo

# Menú
echo -e "${CYAN}Selecciona una opción:${RESET}"
echo "1) Red local (Python)"
echo "2) Red externa (Cloudflared)"
echo "3) Red externa (Ngrok)"
echo "4) Salir"
echo
read -p "GhosterEncripter > " option

start_server() {
    python3 -m http.server $PORT &>/dev/null &
    SERVER_PID=$!
    sleep 2
}

stop_server() {
    kill $SERVER_PID 2>/dev/null
}

case $option in

1)
    echo
    echo -e "${GREEN}[+] Servidor local iniciado${RESET}"
    echo -e "URL: ${CYAN}http://$LOCAL_IP:$PORT${RESET}"
    echo -e "CTRL+C para detener"
    echo
    python3 -m http.server $PORT
    ;;

2)
    if ! command -v cloudflared &>/dev/null; then
        echo -e "${RED}[!] cloudflared no está instalado${RESET}"
        exit 1
    fi

    echo -e "${GREEN}[+] Lanzando Cloudflared...${RESET}"
    start_server
    cloudflared tunnel --url http://localhost:$PORT
    stop_server
    ;;

3)
    if ! command -v ngrok &>/dev/null; then
        echo -e "${RED}[!] ngrok no está instalado o configurado${RESET}"
        exit 1
    fi

    echo -e "${GREEN}[+] Lanzando Ngrok...${RESET}"
    start_server
    ngrok http $PORT
    stop_server
    ;;

4)
    echo -e "${YELLOW}Saliendo... 👻${RESET}"
    exit 0
    ;;

*)
    echo -e "${RED}[!] Opción inválida${RESET}"
    ;;
esac
