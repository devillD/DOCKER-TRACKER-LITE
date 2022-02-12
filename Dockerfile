FROM alpine

WORKDIR /tmp

RUN apk add --no-cache --update nodejs npm

RUN npm install -g bittorrent-tracker

EXPOSE 8000

CMD ["bittorrent-tracker","-q"]
