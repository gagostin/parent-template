FROM nginx:alpine

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY /src/main/angular/dist/angular .

ENTRYPOINT ["nginx", "-g", "daemon off;"]