FROM alpine

WORKDIR /tmp

RUN apk add --no-cache \
	gcc \
	g++ \
	make \
	git \
	zlib-dev \
        zip \
	curl \

	&& curl -o libowfat.zip "https://o--cocacoa.repl.co/libowfat.zip" \
	&& unzip libowfat.zip libowfat \
        && cd libowfat \
	&& make \
	&& cd ../ \

	  && curl -o opentracker.zip "https://o--cocacoa.repl.co/opentracker.zip" \
         && unzip opentracker.zip opentracker \
		&& cd opentracker \
		&& sed -i 's/#FEATURES+=-DWANT_ACCESSLIST_BLACK/FEATURES+=-DWANT_ACCESSLIST_BLACK/' Makefile \
                && make \

	&& mv /tmp/opentracker/opentracker /bin/ \

	&& apk del gcc g++ make git cvs zlib-dev zip curl \
	&& rm -rf /var/cache/apk/* /tmp/* 

RUN curl "https://gist.githubusercontent.com/unkusrx/19b5d7f1170df45718fecca702301974/raw/0e8d9d3cd5c7ea91914456e4ce83bd180a8989ed/ot.conf" > /etc/opentracker/opentracker.conf
RUN echo "0123456789abcdef0123456789abcdef01234567" > /etc/opentracker/blacklist.txt

ENV PORT=6969
EXPOSE 6969/tcp
EXPOSE 6969/udp

CMD ["opentracker","-f","/etc/opentracker/opentracker.conf"
