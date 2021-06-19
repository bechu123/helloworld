FROM golang:1.13.6-alpine3.11 as builder
WORKDIR /john
COPY . .
#RUN go build -mod vendor -o hello-world-bin  .
RUN go build -o hello-world-bin  .

FROM alpine
WORKDIR /app
RUN mkdir /config && mkdir /logs
COPY --from=builder /john/hello-world-bin /app/hello-world
CMD ["/app/hello-world"]
