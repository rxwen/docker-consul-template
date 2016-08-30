FROM alpine
MAINTAINER Raymond Wen

ENV VERSION 0.15.0
RUN apk update
RUN apk add ca-certificates haproxy
RUN wget https://releases.hashicorp.com/consul-template/${VERSION}/consul-template_${VERSION}_linux_amd64.zip -O consul-template.zip  && unzip consul-template.zip -d /usr/bin && rm consul-template.zip
COPY files/haproxy.json /tmp/haproxy.json
COPY files/haproxy.ctmpl /tmp/haproxy.ctmpl

CMD ["consul-template", "-config=/tmp/haproxy.json"]
