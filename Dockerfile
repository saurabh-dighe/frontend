FROM        nginx
RUN         rm -rf /usr/share/nginx/html/* |rm -rf /etc/nginx/conf.d/*
COPY        default.conf /etc/nginx/conf.d/default.conf
COPY        static /usr/share/nginx/html/
