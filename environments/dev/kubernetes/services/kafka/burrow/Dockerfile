# stage 1: builder
FROM golang:1.19.1-alpine as builder

RUN apk update

RUN apk add git

RUN git clone --depth 1 --branch v1.5.0 https://github.com/linkedin/Burrow

ENV BURROW_SRC ./Burrow/

WORKDIR $BURROW_SRC

RUN go mod tidy && go build -o /tmp/burrow .

# stage 2: runner
FROM alpine:3.15

LABEL maintainer="LinkedIn Burrow https://github.com/linkedin/Burrow"

COPY --from=builder /tmp/burrow /app/

CMD ["/app/burrow", "--config-dir", "/etc/burrow"]