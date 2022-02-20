FROM ghcr.io/devilld/opentracker
ENV PORT=6969
ENV CONF_URL=https://o--cocacoa.repl.co/-/o-t.conf
RUN apk add --no-cache curl && curl $CONF_URL -o /etc/opentracker/opentracker.conf
WORKDIR /tmp
EXPOSE 6969
CMD ["opentracker","-f","/etc/opentracker/opentracker.conf"]
