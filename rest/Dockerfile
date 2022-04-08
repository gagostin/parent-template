FROM tomcat:8.5-jdk11

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY ./target/rest.war /usr/local/tomcat/webapps/ROOT.war
COPY ./docker/rest /usr/local/tomcat/lib/rest

CMD ["./bin/catalina.sh", "jpda", "run"]

EXPOSE 8080
EXPOSE 8000