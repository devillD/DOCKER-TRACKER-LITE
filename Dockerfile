FROM node:14-slim

WORKDIR /tmp

RUN npm install -g bittorrent-tracker

EXPOSE 8000

CMD ["bittorrent-tracker"]
