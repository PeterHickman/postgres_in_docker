FROM postgres:9.6-alpine

EXPOSE 5432:5432

#NAME pg9.6

# The data in the container lives here, map it to somewhere more permanent
#VOLUME $(pwd)/pgdata9.6:/var/lib/postgresql/data:rw

# Somewhere to put files so that they can be accessed from inside
# the container for the likes of pg_dump and pg_restore
#VOLUME $(pwd)/pgdata9.6/backups:/backups:rw

#RESTART unless-stopped

ENV POSTGRES_PASSWORD asdasdasd
ENV POSTGRES_USER peterhickman
ENV POSTGRES_DB default
ENV POSTGRES_HOST_AUTH_METHOD password
