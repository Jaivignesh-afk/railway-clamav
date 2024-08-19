FROM clamav/clamav:1.4
COPY configure-env.sh /custom-init/configure-env.sh
RUN chmod +x /custom-init/configure-env.sh
RUN ./custom-init/configure-env.sh
ENTRYPOINT ["/init"]
