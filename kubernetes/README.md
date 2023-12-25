# Come utilizzare il kustomization di Kubernetes

Prima della creazione del cluster kubernetes assicurarsi di avere a disposizione tutte le immagini docker per lo stack.
Tali immagini devono essere presenti sul registry utilizzato per le varie pull.
Per creare tutte le immagini in locale da pushare su un qualunque registry, seguire i seguenti passaggi:

### Creazione delle immagini
* Per tutti i pacchetti ad eccezione del frontend:
```
mvn clean install -DskipTests
```
Tale comando creerà le cartelle target utilizzati dai vari dockerfile del docker-compose.yml.
* Per il frontend:
```
npm install
npm run ng build
```
Tale comando creerà la cartella dist che sarà poi utilizzata dal dockerfile del frontend.

#### Importante:
Sul docker-compose file sono commentati gli script di inizializzazione dei database.
Se si vuole usare lo stack kubernates vanno lasciati così e il db va inizializzato successivamente quando lo stack è già in piedi.

&nbsp;

A questo punto lanciare:
```
docker-compose build
```
che creerà tutte le immagini in locale, pronte al push sul registry.


## Utilizzo del registry di Github:
### Aggiornamento del secret
Nella cartella kubernetes è presente il file secret.yml. In questo file c'è la sezione dockerconfigjson che deve contenere
il base64 del file config.json presente nella cartellina secret. All'interno di questo config.json è presente la configurazione
delle credenziali di accesso al GitHub Container Registry. Poiché i token GitHub hanno durata limitata, quando il token viene
aggiornato, è necessario aggiornare anche questo file nelle sezioni 'password' e 'auth'.
Quindi:
* Aggiornare il campo password nel config.json con il nuovo token GitHub
* Generare il campo auth utilizzando questo comando, che genererà sul terminale una stringa da copiare ed incollare
```
echo -n 'github_username:nuovo_token' | base64
```
* Generare la stringa base64 del config.json da utilizzare in dockerconfigjson del secret.yml
```
cat config.json | base64
```

### Push delle immagini su ghcr.io
* Collegarsi al registry:
```
docker login ghcr.io -u 'username' -p 'github token'
```

* Taggare ogni immagine:
```
docker tag parent-template/rest-db ghcr.io/gagostin/parent-template/rest-db
docker tag parent-template/keycloak-db ghcr.io/gagostin/parent-template/keycloak-db
docker tag parent-template/rest ghcr.io/gagostin/parent-template/rest
docker tag parent-template/keycloak ghcr.io/gagostin/parent-template/keycloak
docker tag parent-template/frontend ghcr.io/gagostin/parent-template/frontend
```

* Push di tutte le immagini:
```
docker push ghcr.io/gagostin/parent-template/rest-db
docker push ghcr.io/gagostin/parent-template/rest
docker push ghcr.io/gagostin/parent-template/keycloak-db
docker push ghcr.io/gagostin/parent-template/keycloak-db
docker push ghcr.io/gagostin/parent-template/frontend-db
```

## Utilizzo di un registry locale

### Creazione
Prima di tutto va creato un registry locale in cui pushare le immagini che saranno utilizzate dallo stack kubernetes:
```
docker run -d -p 5000:5000 --restart=always --name local-registry registry:2
```

### Tag e push delle immagini sul registry
Tutte le immagini create devono essere taggate e pushate sul registry locale:
```
docker tag 'nome_immagine' localhost:5000/'nome_immagine'
docker push localhost:5000/'nome_immagine'
```

### Start dello stack kubernetes
A questo punto lo stack può partire:
```
kubectl apply -k .
```

# Inizializzazione dei database:
Con un port forward esporre la porta del db desiderato per collegamento esterno:
```
kubectl get services -n parent-template
kubectl port-forward service/'nome_servizio' 5432:5432 -n parent-template
```
Collegarsi al db con un client come dbeaver e lanciare lo script