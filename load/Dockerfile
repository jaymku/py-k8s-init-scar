FROM alpine:latest

RUN apk add --no-cache curl

ENTRYPOINT ["watch", "-n", "5", "curl", "http://python-demo-web-api:5000/hello"]