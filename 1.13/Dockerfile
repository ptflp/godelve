FROM golang:1.13-alpine

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

WORKDIR /app

RUN apk add --virtual build-dependencies --no-cache ca-certificates \
        dpkg \
        gcc \
        git \
        musl-dev \
        openssh-client \
    && mkdir -p "$GOPATH/src" "$GOPATH/bin" \
    && chmod -R 777 "$GOPATH" \
    && go get github.com/derekparker/delve/cmd/dlv \
    && apk del build-dependencies

EXPOSE 5813

CMD [ "sh", "-c", "dlv debug --headless --continue --listen=:5813 --accept-multiclient --api-version=2 $CONFIG_FILE" ]