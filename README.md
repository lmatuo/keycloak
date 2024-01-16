# Keycloak version 23.0.4

# Connected with boschtire-keycloakdev web app
# And also using boschtiredevcr for container images

# build commands:
    - `docker build -t keycloak-image .`
    - `docker run -d -p 8080:8080 --name keycloak-container keycloak-image`