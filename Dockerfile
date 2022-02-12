FROM alpine

WORKDIR /tmp

RUN apk add --no-cache \
	gcc \
	g++ \
	make \
	git \
	cvs \
	zlib-dev \
	curl \

	&& cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat \
	&& cd libowfat \
	&& make \
	&& cd ../ \
	
	&& curl "https://gist.githubusercontent.com/devillD/76d13f2e0a685a1ad6c1277ee19b2b5b/raw/c1733cbf75242df36e952b63265ecf39efe04783/ot.conf" > opentracker.conf \
        && echo "0123456789abcdef0123456789abcdef01234567" > blacklist.txt \

	&& git clone git://erdgeist.org/opentracker \
		&& cd opentracker \
		&& sed -i 's/#FEATURES+=-DWANT_ACCESSLIST_BLACK/FEATURES+=-DWANT_ACCESSLIST_BLACK/' Makefile \
                && make \

	&& mv /tmp/opentracker/opentracker /bin/ \

	&& apk del gcc g++ make git cvs zlib-dev curl \
	&& rm -rf /var/cache/apk/* /tmp/*

COPY ./opentracker.conf /etc/opentracker/opentracker.conf
COPY ./blacklist.txt	/etc/opentracker/blacklist.txt

EXPOSE 6969/tcp
EXPOSE 6969/udp

CMD ["opentracker","-f","/etc/opentracker/opentracker.conf"]
