FROM alpine

RUN apk add --no-cache --update nodejs npm

RUN npm install -g bittorrent-tracker

CMD ["bittorrent-tracker","-p","$PORT"]
