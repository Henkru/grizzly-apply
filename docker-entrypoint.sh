#!/bin/sh
[ -z "$GRAFANA_URL" ]  && echo "GRAFANA_URL is not specified" && exit 1

TIMEOUT=${TIMEOUT:-60}
CONFIG_PATH=${CONFIG_PATH:-"/conf.d"}

echo "Waiting Grafana to be available..."
for CNT in $(seq $TIMEOUT); do
    wget $GRAFANA_URL -q -O - > /dev/null && break
    sleep 2
done

[ $CNT -ge $TIMEOUT ] && echo "Timeout reached" && exit 1

for f in $(find "$CONFIG_PATH" -type f -name "datasource-*.yml"); do
    echo Applying datasource: $f
    grr apply $f
done

for f in $(find "$CONFIG_PATH" -type f -name "dashboard-*.yml"); do
    echo Applying dashboard: $f
    grr apply $f
done
