FROM postgres

# Arguments
# ARG POSTGRES_USER
# ARG POSTGRES_PASSWORD
# ARG POSTGRES_DB

# Envinorment Variables 
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=spontan

COPY postgres_scripts/users.sql /docker-entrypoint-initdb.d/

