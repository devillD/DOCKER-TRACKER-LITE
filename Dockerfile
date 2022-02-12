FROM node:14-slim

WORKDIR /tmp

RUN npm install -g bittorrent-tracker

CMD ["bittorrent-tracker"]
