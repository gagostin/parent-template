#Generate a token on GitHub
1. Login to GitHub
2. Profile > Settings > Developer settings > Personal access tokens
3. Click on token and generate or regenerate
4. Copy the token for use it

#Use the GitHub token on IntelliJ
1. File > Settings > Version Control > GitHub
2. On connection https://github.com use the generated token

#Keycloak URLs
Administration console 
```
http://{keycloak_url}:{keycloak_port}/auth/admin
```
User console
```
http://{keycloak_url}:{keycloak_port}/auth/realms/{realm_name}/account
```

#Da fare:
```
1. Inserire la gestione di Keycloak come identity provider
2. Inserire il wordpress
```