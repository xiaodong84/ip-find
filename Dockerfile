FROM golang:alpine
LABEL Author="James Li"
#MAINTAINER James Li <james.li@lxd.org.cn>
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN mkdir /app;apk update;apk add tzdata
WORKDIR /app
COPY ip.go /app/
RUN go build ip.go
ENV TZ=Asia/Shanghai
CMD ./ip
