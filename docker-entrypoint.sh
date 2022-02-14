#!/bin/sh

for f in $(find /conf.d -type f -name "datasource-*.yml"); do
    echo Applying datasource: $f
    grr apply $f
done

for f in $(find /conf.d -type f -name "dashboard-*.yml"); do
    echo Applying dashboard: $f
    grr apply $f
done
