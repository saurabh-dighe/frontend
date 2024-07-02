FROM        nginx
RUN         rm -rf /usr/share/nginx/html/*  /etc/nginx/default.d/default.conf
COPY        default.conf /etc/nginx/default.d/default.conf
COPY        static /usr/share/nginx/html/

