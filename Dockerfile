FROM ghcr.io/devilld/opentracker
WORKDIR /tmp
CMD ["opentracker","-f","/etc/opentracker/opentracker.conf"]
