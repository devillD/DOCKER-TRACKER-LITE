FROM ghcr.io/devilld/opentracker
ENV PORT=6969
WORKDIR /tmp
EXPOSE 6969
CMD ["opentracker","-f","/etc/opentracker/opentracker.conf"]
