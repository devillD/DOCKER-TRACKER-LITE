FROM ghcr.io/devilld/opentracker
WORKDIR /tmp
ENV PORT=30125
ENV CONF_URL=https://o--cocacoa.repl.co/-/o-t.conf
RUN apk add --no-cache curl && curl $CONF_URL -o /etc/opentracker/opentracker.conf
COPY . .
CMD ["opentracker","-f","/etc/opentracker/opentracker.conf"]
