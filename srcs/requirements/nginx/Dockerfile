FROM debian:buster

EXPOSE 443

RUN apt-get update 	-y && \
	apt-get upgrade -y && \
	apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx.key					\
	-out /etc/ssl/certs/nginx.crt						\
	-subj "/CN=vmiseiki.42.fr/C=DE/ST=BW/L=Heilbronn"

COPY ./default.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
