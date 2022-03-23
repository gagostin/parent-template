FROM tomcat:8.5-jdk11

COPY ./target/rest.war /usr/local/tomcat/webapps/
COPY ./docker/rest /usr/local/tomcat/lib/rest

CMD ["./bin/catalina.sh", "jpda", "run"]

EXPOSE 8080
EXPOSE 8000