# 👻 GHOSTERENCRIPTER FRAMEWORK 👻


   ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗███████╗██████╗
  ██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
  ██║  ███╗███████║██║   ██║███████╗   ██║   █████╗  ██████╔╝
  ██║   ██║██╔══██║██║   ██║╚════██║   ██║   ██╔══╝  ██╔══██╗
  ╚██████╔╝██║  ██║╚██████╔╝███████║   ██║   ███████╗██║  ██║
   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
      [ GhosterEncripter :: Encryption Access Framework ]



• No dependencias pesadas
• No frameworks innecesarios
• No servicios residentes
• Control total desde CLI
• Cero persistencia
• Cero ruido
• Los servicios de mensajeria no rompen el cifrado

⚙️ CAPACIDADES
[✔] Servidor HTTP bajo demanda
[✔] Exposición en red local
[✔] Exposición en red externa
[✔] Soporte Cloudflared
[✔] Soporte Ngrok
[✔] Detección automática de IP
[✔] Selección manual de puerto
[✔] Limpieza de procesos

🧬 ARQUITECTURA
GhosterEncripter actúa como una capa de acceso, separando:
[ INTERFAZ WEB ]  <———>  [ GHOSTERENCRIPTER ]  <———>  [ RED ]
Esto permite:

Cambiar la herramienta web sin tocar el framework

Usar múltiples payloads web

Exponer herramientas sin modificar router/firewall

Ejecutar solo cuando es necesario

🛠️ REQUISITOS

Base

Bash

Python 3

iproute2

Opcionales (según modo de exposición)

cloudflared

ngrok

Instalación base (Debian / Ubuntu)

sudo apt update
sudo apt install python3 iproute2

 INSTALACIÓN

git clone https://github.com/Ramver66/GhostEnctipter
cd GhosterEncripter
chmod +x GhostEncripter.sh
./GhostEncripter.sh

Menú interactivo:
1) Red local
2) Red externa (Cloudflared)
3) Red externa (Ngrok)
4) Salir

GhosterEncripter levanta el servicio solo cuando se necesita
y lo destruye al salir.


🌐 MODOS DE EXPOSICIÓN

RED LOCAL

Acceso desde la misma red (LAN).
http://IP_LOCAL:PUERTO
Ideal para:

    Laboratorios

    Pruebas internas

    Entornos controlados

RED EXTERNA — CLOUDFLARED

Exposición pública sin abrir puertos.

Ventajas:

    No NAT

    No port forwarding

    No configuración de firewall

RED EXTERNA — NGROK

Exposición pública clásica mediante túnel.

Ventajas:

    Rápido

    Popular

    Fácil de compartir

Recomendaciones:

    Usar solo herramientas confiables

    No exponer información sensible

    Asumir que los túneles públicos pueden ser monitoreados

DISCLAIMER

Este framework está pensado para:

    Educación

    Investigación

    Testing

    Demos

    Laboratorios

El autor NO se responsabiliza del uso indebido.

AUTOR

GhostEncoder

CLI • Bash • Shadow Tools

Si este framework te fue útil:

git star GhosterEncripter

Las herramientas silenciosas también dejan huRamella.GhostEnG
