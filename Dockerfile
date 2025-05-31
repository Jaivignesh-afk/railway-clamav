FROM clamav/clamav:latest
COPY configure-env.sh /custom-init/configure-env.sh
RUN chmod +x /custom-init/configure-env.sh
RUN ./custom-init/configure-env.sh
ENTRYPOINT ["/init"]
