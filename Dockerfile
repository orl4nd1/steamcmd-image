FROM ghcr.io/parkervcp/steamcmd:debian

# Cambiar a usuario root para instalar paquetes
USER root

# Instalar procps para usar sysctl
RUN apt-get update && apt-get install -y procps

# Configurar el rango de puertos locales
RUN echo "net.ipv4.ip_local_port_range = 49152 65535" >> /etc/sysctl.conf && \
    sysctl -w net.ipv4.ip_local_port_range="49152 65535"

# Volver al usuario original (opcional)
USER steam

ENTRYPOINT ["/bin/bash"]
