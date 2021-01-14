FROM golang:alpine as builder
LABEL Author="James Li"
#MAINTAINER James Li <james.li@lxd.org.cn>
WORKDIR /app
COPY ip.go /app/
RUN go build ip.go

FROM alpine
RUN mkdir /app
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update;apk add tzdata
WORKDIR /app
COPY --from=builder /app/ip .
ENV TZ=Asia/Shanghai
CMD /app/ip
