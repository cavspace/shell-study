#!/bin/bash

param_1=参数一
param_2=

service_name=sacalaDemo

echo "[$1,$2,$3]"

if [ -n "$1" ]; then
 param_1=$1
fi

# 构建 Telemetry agent参数, 如果start.sh $3参数没有传值, 此函数返回''
function buildTelemetryAgentArg() {
  if [ -n "$1" ]
  then
    echo "-javaagent:/deploy/opentelemetry-javaagent.jar -Dotel.traces.exporter=zipkin -Dotel.metrics.exporter=none -Dotel.exporter.zipkin.endpoint=$1 -Dotel.resource.attributes=service.name=${service_name}"
  else
    echo ''
  fi
}

result=$(buildTelemetryAgentArg $3)
echo "buildTelemetryAgentArg:${result}"
