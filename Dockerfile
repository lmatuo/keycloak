# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:23.0.4

# Set environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Configurar a URL base do Keycloak para HTTPS
ENV KEYCLOAK_FRONTEND_URL=https://boschtire-keycloakdev.azurewebsites.net/

# Adicionar a configuração para passagem de endereços de proxy
ENV PROXY_ADDRESS_FORWARDING=true

ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=true
ENV KC_HTTP_ENABLED=false
ENV KC_PROXY=edge

ENV KC_HOSTNAME=boschtire-keycloakdev.azurewebsites.net

# Expose the necessary port 8080
# EXPOSE 8080

# Start Keycloak with additional configurations
CMD ["-Dkeycloak.frontendUrl=${KEYCLOAK_FRONTEND_URL}", "-Djboss.bind.address=0.0.0.0", "--debug", "start-dev"]
