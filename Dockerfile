# Use a base image do Keycloak
FROM jboss/keycloak:latest

# Adicione customizações, se necessário
# COPY custom-config-files /opt/jboss/keycloak/standalone/configuration/

# Defina variáveis de ambiente, se necessário
ENV KEYCLOAK_USER=admin
ENV KEYCLOAK_PASSWORD=admin

# Exponha a porta necessária (se diferente de 8080)
# EXPOSE 8080

# Configurar a URL base do Keycloak para HTTPS
ENV KEYCLOAK_FRONTEND_URL=https://boschtire-keycloakdev16.azurewebsites.net/auth/

# Comando de inicialização padrão do Keycloak
CMD ["-b", "0.0.0.0", "-Dkeycloak.frontendUrl=https://boschtire-keycloakdev16.azurewebsites.net/auth/"]
