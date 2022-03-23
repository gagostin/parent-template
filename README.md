#Generate a token on GitHub
1. Login to GitHub
2. Profile > Settings > Developer settings > Personal access tokens
3. Click on token and generate or regenerate
4. Copy the token for use it

#Use the GitHub token on IntelliJ
1. File > Settings > Version Control > GitHub
2. On connection https://github.com use the generated token

#Da fare:
1. Sul pom.xml del frontend ho inserito un sacco di plugin copiati dalla svizzera; questi plugin fanno riferimento fanno riferimento a diversi script che devono essere definiti nel package.json oppure devono essere inseriti come script js sotto la cartella angular, allo stesso livello di src
2. Va creato il servizio frontend nel compose
3. Inserire la gestione di Keycloak come identity provider
4. Inserire il wordpress