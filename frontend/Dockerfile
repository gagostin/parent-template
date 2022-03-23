FROM harbor.mgm.grouperci.com/common/httpd:2.4

EXPOSE 80/tcp

COPY docker/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY target/front-end/app/ /usr/local/apache2/htdocs/rci/
COPY target/front-end/cms/ /usr/local/apache2/htdocs/cms/
COPY src/main/angular/src/environments/environment.dev.js /usr/local/apache2/htdocs/rci/environment.js