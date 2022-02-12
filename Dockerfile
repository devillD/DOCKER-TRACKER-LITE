FROM alpine

WORKDIR /tmp

RUN apk add --no-cache \
	nodejs \
	npm \

	&& npm install -g bittorrent-tracker

CMD ["bittorrent-tracker","-q","--http","--ws"]
