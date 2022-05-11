FROM debian:buster

#installation nginx
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN apt-get install wget -y

COPY ./conf /etc/nginx/nginx.conf


RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64 -O mkcert 
RUN chmod 755 mkcert && ./mkcert -install && ./mkcert -cert-file /etc/ssl/certs/localhost.pem -key-file /etc/ssl/certs/localhost-key.pem localhost sendmail

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]