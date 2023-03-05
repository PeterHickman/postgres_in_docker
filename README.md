# Running PostgreSQL in a container

Assuming you are using the `Dockerfile`

```
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
```

If you want to use this with another version of PostgreSQL then you will need to replace all the references to `9.6` in the `Dockerfile` and the files in `shims` to the new version

You can also change the username if you want :)

## Set up some shims in `/usr/local/bin/`

```bash
$ sudo ./install_shims
```

Will do the job, note that the username, `peterhickman`, is hardcoded into each shim matching the username in the `Dockerfile`

## Usage

To restore a file copy it into `$(pwd)/pgdata9.6/backups` as set in the `Dockerfile` and you can restore with `pg_restore -O -F c -d oddsfeed_development /backups/oddsfeed_production.2023-02-27T00-00-01.backup`. Dump in a similar manner

I have added a tool in `shims` called `pgdata` that copies data to and from the `$(pwd)/pgdata9.6/backups` directory and 
