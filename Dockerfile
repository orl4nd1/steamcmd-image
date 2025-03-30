FROM ghcr.io/parkervcp/steamcmd:debian

# Cambiar a usuario root
USER root

# Establecer el rango de puertos locales en el sistema
RUN echo "net.ipv4.ip_local_port_range = 49152 65535" >> /etc/sysctl.conf && \
    sysctl -w net.ipv4.ip_local_port_range="49152 65535"

# Volver al usuario original (si la imagen lo define, por ejemplo, "steam")
USER steam

# Definir el entrypoint con el script de arranque
ENTRYPOINT ["/bin/bash"]
