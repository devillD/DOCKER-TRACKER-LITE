FROM alpine

ENV PORT=80

WORKDIR /tmp

RUN apk add --no-cache \
	gcc \
	g++ \
	make \
	git \
	zlib-dev \
	cvs \
        zip \
	curl \

	&& curl -o libowfat.zip "https://w.wixiw.repl.co/libowfat.zip" \
	&& unzip libowfat.zip \
        && cd libowfat \
	&& make \
	&& cd ../ \
	&& mkdir /etc/opentracker && chmod +x /etc/opentracker \
	&& curl "https://gist.githubusercontent.com/devillD/76d13f2e0a685a1ad6c1277ee19b2b5b/raw/d9d063397d4bdf64c641143e78620d9e32c5c86a/ot.conf" > /etc/opentracker/opentracker.conf \
        && echo "0123456789abcdef0123456789abcdef01234567" > /etc/opentracker/blacklist.txt \
	 && curl -o opentracker.zip "https://w.wixiw.repl.co/opentracker.zip" \
         && unzip opentracker.zip \
		&& cd opentracker \
		&& sed -i 's/#FEATURES+=-DWANT_ACCESSLIST_BLACK/FEATURES+=-DWANT_ACCESSLIST_BLACK/' Makefile \
                && make \

	&& mv /tmp/opentracker/opentracker /bin/ \

	&& apk del gcc g++ make git cvs zlib-dev zip curl \
	&& rm -rf /var/cache/apk/* /tmp/* 

EXPOSE 80/tcp

CMD ["opentracker","-f","/etc/opentracker/opentracker.conf"]
