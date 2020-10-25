FROM golang:1.14.7

ADD ./app/golang/main.go /go/src/

EXPOSE 8080

CMD ["/usr/local/go/bin/go", "run", "/go/src/main.go"]
