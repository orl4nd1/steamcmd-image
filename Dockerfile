FROM ghcr.io/parkervcp/steamcmd:debian

# Establecer el rango de puertos locales en el sistema
RUN echo "net.ipv4.ip_local_port_range = 49152 65535" >> /etc/sysctl.conf && \
    sysctl -w net.ipv4.ip_local_port_range="49152 65535"

# Crear un script de arranque para aplicar sysctl en cada ejecución
RUN echo '#!/bin/bash\nsysctl -p\nexec "$@"' > /usr/local/bin/start.sh && \
    chmod +x /usr/local/bin/start.sh

# Definir el entrypoint con el script de arranque
ENTRYPOINT ["/usr/local/bin/start.sh"]
CMD ["/bin/bash"]
