FROM alpine/curl:8.1.2 as digicert

WORKDIR /app

RUN curl https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem -o DigiCertGlobalRootCA.crt.pem

# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:23.0.4

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

ENV KEYCLOAK_FRONTEND_URL=https://sentinela-keycloakdev-postgres.azurewebsites.net/

ENV PROXY_ADDRESS_FORWARDING=true

ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=true
ENV KC_HTTP_ENABLED=false
ENV KC_PROXY=edge

ENV KC_HOSTNAME=sentinela-keycloakdev-postgres.azurewebsites.net

ENV KC_DB=postgres

# ENV KC_DB_DRIVER=org.postgresql.Driver
# ENV KC_TRANSACTION_XA_ENABLED=false
ENV KC_DB_DRIVER=org.postgresql.xa.PGXADataSource
ENV KC_TRANSACTION_XA_ENABLED=true

ENV KC_DB_USERNAME=userAdmin
ENV KC_DB_PASSWORD=DevDbPassword2024

ENV KC_DB_URL=jdbc:postgresql://sentinela-db-server-postgres.postgres.database.azure.com:5432/db_keycloak?ssl=true^&sslmode=verify-full

# ENV KC_DB_URL_DATABASE=keycloak-poc
# ENV KC_DB_URL_HOST=172.17.0.1
# ENV KC_DB_URL_PORT=5432

# EXPOSE 8080

COPY --from=digicert /app/DigiCertGlobalRootCA.crt.pem /opt/keycloak/.postgresql/root.crt

# Start Keycloak with additional configurations
CMD ["-Dquarkus.transaction-manager.enable-recovery=true", "-Dkeycloak.frontendUrl=${KEYCLOAK_FRONTEND_URL}", "--verbose", "--debug", "start-dev"]
