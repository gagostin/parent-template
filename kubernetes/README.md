# Creazione di un registry locale
Prima di tutto va creato un registry locale in cui pushare le immagini che saranno utilizzate dallo stack kubernetes:
```
docker run -d -p 5000:5000 --restart=always --name local-registry registry:2
```

# Creazione delle immagini 
Successivamente vanno buildate tutte le immagini dalla root di progetto 
(assicurarsi di aver usato le build di maven per la creazione di tutte le cartelle target):

#### Importante: 
Sul docker-compose file sono commentati gli script di inizializzazione dei database. 
Se si vuole usare lo stack kubernates vanno lasciati così, e il db va inizializzato successivamente quando lo stack è già in piedi 

```
docker-compose build
```

# Tag e push delle immagini sul registry
Tutte le immagini create devono essere taggate e pushate sul registry locale:
```
docker tag 'nome_immagine' localhost:5000/'nome_immagine'
docker push localhost:5000/'nome_immagine'
docker images localhost:5000/parent-template/*
```

# Start dello stack kubernetes
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


# Comandi utili:
```
kubectl get pods -o wide -w -n parent-template
kubectl delete -k .
```