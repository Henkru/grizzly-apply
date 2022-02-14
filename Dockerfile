FROM grafana/grizzly:latest

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
