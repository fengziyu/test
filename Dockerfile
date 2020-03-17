FROM nginx:alpine

EXPOSE 80

WORKDIR /

ADD dist /usr/share/nginx/html
ADD default.conf /etc/nginx/conf.d
