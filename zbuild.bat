echo on

if errorlevel 1 exit /b

gradlew.bat assemble

gradlew.bat publishToMavenLocal


curl -v -i -X POST http://localhost:5000/verify-tracecontext ^
-H "Content-Type: application/json" ^
-H "traceparent: 00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01" ^
-d "[{\"url\":\"https://www.amazon.com\",\"arguments\":[]}]"
