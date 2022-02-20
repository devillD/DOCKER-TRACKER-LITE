FROM ghcr.io/devilld/opentracker
WORKDIR /tmp
ENV PORT=6969
EXPOSE 6969/tcp
EXPOSE 6969/udp
CMD ["opentracker","-f","/etc/opentracker/opentracker.conf"]
