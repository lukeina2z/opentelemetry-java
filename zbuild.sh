#!/bin/sh

set -e
set -x


./gradlew assemble

./gradlew publishToMavenLocal


curl -v -X POST http://localhost:5000/verify-tracecontext \
-H "Content-Type: application/json" \
-H "traceparent: 00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01" \
-d '[{"url":"http://localhost:8080/downstream","arguments":[]}]'

