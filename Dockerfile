FROM        nginx:latest
RUN         rm -rf /usr/share/nginx/html/*
COPY        localhost.conf /usr/share/nginx/html/default.conf
COPY        static /usr/share/nginx/html

