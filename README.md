#Creazione di una network
```
docker network create -d bridge parent-template
```

#Build dell'immagine docker per il db postgres di rest
Dal parent:
```
docker build -t rest-db -f docker/rest-db/Dockerfile .
docker run -p 5432:5432 --net=parent-template --name rest-db --env-file docker/rest-db/resources/rest-db.env rest-db 
```

#Build dell'immagine docker per il rest
###Prerequisito:
Da /rest:
```
mvn clean install
```
In modo da generare il rest.war.\
Poi, dalla root:
```
docker build -t rest -f docker/rest/Dockerfile .
docker run -p 8080:8080 --net=parent-template --name rest rest
```