FROM golang:1.8.3-alpine as BUILDER
MAINTAINER john@johnmccabe.net
ENTRYPOINT []

RUN apk --no-cache add make
WORKDIR /go/src/github.com/johnmccabe/faas-img2ansi
COPY . /go/src/github.com/johnmccabe/faas-img2ansi

RUN make

FROM alpine

COPY --from=builder /go/bin/faas-img2ansi /usr/bin
ADD https://github.com/alexellis/faas/releases/download/0.6.0/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog
RUN chmod +x /usr/bin/faas-img2ansi

ENV fprocess "/usr/bin/faas-img2ansi"

CMD [ "/usr/bin/fwatchdog"]