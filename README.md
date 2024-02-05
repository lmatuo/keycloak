# keycloak

# build commands:
    - `docker build -t keycloak-image .`
    - `docker run -d -p 8080:8080 --name keycloak-container keycloak-image`

# change informations on Dockerfile:
    - KEYCLOAK_FRONTEND_URL
    - KC_HOSTNAME
    - KC_DB_USERNAME
    - KC_DB_PASSWORD
    - KC_DB_URL

# add to application settings:
    - WEBSITES_CONTAINER_START_TIME_LIMIT: 1800

# choose "always on" in the general settings.
