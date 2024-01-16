# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:23.0.4

# Set environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Configurar a URL base do Keycloak para HTTPS
ENV KEYCLOAK_FRONTEND_URL=http://localhost:8080/

# Expose the necessary port
# EXPOSE 8080

# Start Keycloak with additional configurations
CMD ["-Dkeycloak.contextPaxth=/", "-Dkeycloak.frontendUrl=${KEYCLOAK_FRONTEND_URL}", "-Djboss.bind.address=0.0.0.0", "--debug", "start-dev",  "--import-realm", "--http-relative-path=/auth"]