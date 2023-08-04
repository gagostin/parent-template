# Generate a token on GitHub
1. Login to GitHub
2. Profile > Settings > Developer settings > Personal access tokens
3. Click on token and generate or regenerate
4. Copy the token for use it

# Use the GitHub token on IntelliJ
1. File > Settings > Version Control > GitHub
2. On connection https://github.com use the generated token

# Keycloak URLs
Administration console 
```
http://{keycloak_url}:{keycloak_port}/auth/admin
```
User console
```
http://{keycloak_url}:{keycloak_port}/auth/realms/{realm_name}/account
```

# Create a dump of postgres/mysql database
Connecting to docker container of db
```
docker exec -it {container_id} bash
```
Create the .sql dump from command line
```
postgres:   pg_dump -U {db_username} -W -F p --inserts --encoding=UTF-8 {db_name} > {dump_filename}.sql
mysql:      mysqldump -u {db_username} --password={db_password} --default-character-set=utf8 --no-tablespaces {db_name} > {dump_filename}.sql
```
Extract the .sql dump file from the docker container to pc
```
docker cp {container_id}:/{dump_filename}.sql {pc_path}
```
NB. The / is for "root": when the dump command was execute, I was in the root folder of docker container, so the dump file was created there)

# Da fare:
- Provare a disabilitare la creazione dell'evento al click sulle pagine di dettaglio del giorno
- Creare una pagina per la gestione di tutti i catch error (una rotta /error dedicata)
