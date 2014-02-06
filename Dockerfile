FROM       ubuntu
MAINTAINER Johannes 'fish' Ziemke <fish@docker.com> (@discordianfish)

RUN        apt-get update && apt-get install -yq curl git
RUN        curl -s https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz | tar -C /usr/local -xzf -
ENV        PATH    /usr/local/go/bin:$PATH
ENV        GOPATH  /go

ADD        . /pingr
WORKDIR    /pingr
RUN        go get -d && go build
ENTRYPOINT [ "./pingr" ]
EXPOSE     8000
