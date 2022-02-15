FROM alpine/git:v2.32.0 as grafonnet

RUN git clone https://github.com/grafana/grafonnet-lib.git /tmp

FROM grafana/grizzly:latest as grizzly

COPY --from=grafonnet /tmp/grafonnet /jsonnet-libs/grafonnet
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
