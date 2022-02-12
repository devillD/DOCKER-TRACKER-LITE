FROM alpine

WORKDIR /tmp

RUN apk add --no-cache \
	gcc \
	g++ \
	make \
	git \
	cvs \
	zlib-dev \

	&& cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat \
	&& cd libowfat \
	&& make \
	&& cd ../ \

	&& git clone git://erdgeist.org/opentracker \
		&& cd opentracker \
		&& sed -i 's/#FEATURES+=-DWANT_ACCESSLIST_BLACK/FEATURES+=-DWANT_ACCESSLIST_BLACK/' Makefile \
                && make \

	&& mv /tmp/opentracker/opentracker /bin/ \

	&& apk del gcc g++ make git cvs zlib-dev \
	&& rm -rf /var/cache/apk/* /tmp/* 

COPY ./opentracker.conf /etc/opentracker/opentracker.conf
COPY ./blacklist.txt	/etc/opentracker/blacklist.txt

CMD ["opentracker","-f","/etc/opentracker/opentracker.conf"]
