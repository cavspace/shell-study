SPRING_APP_NAME=airadar-user-service
OTEL_EXPORTER_ZIPKIN_ENDPOINT=


if [ -n "$1" ]; then
 SKYWALKING_BACKEND_URL=$1
 echo $1
fi
openTelemetryParams=
if [ -n "$2" ]; then
 OTEL_EXPORTER_ZIPKIN_ENDPOINT=$2
 echo $2
 openTelemetryParams='-javaagent:/deploy/opentelemetry-javaagent.jar -Dotel.traces.exporter=zipkin -Dotel.metrics.exporter=none -Dotel.exporter.zipkin.endpoint='$2' -Dotel.resource.attributes=service.name='${SPRING_APP_NAME}
 echo $openTelemetryParams
fi

echo $OTEL_EXPORTER_ZIPKIN_ENDPOINT/$SPRING_APP_NAME


if [ -n "$OTEL_EXPORTER_ZIPKIN_ENDPOINT" ]; then
  echo $OTEL_EXPORTER_ZIPKIN_ENDPOINT
fi