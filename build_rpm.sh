#!/bin/bash


docker run -i -v `pwd`:/unbound_exporter gari123/fpm /bin/sh << 'EOF'
set -ex


VERSION="v0.3"
RC="1"

cd /unbound_exporter
DIR="rpm"
if [ ! -d "$DIR" ]; then
    mkdir $DIR
fi

fpm -s dir -n "unbound_exporter" \
-p rpm/ \
-v $VERSION \
--iteration $RC \
-t rpm --rpm-os linux \
-a x86_64 \
--rpm-dist el7 \
--url "https://github.com/gari/unbound_exporter" \
--license "Apache Software License 2.0" \
--maintainer "Igor Kozlov igor.kozlov@corp.mail.ru" \
--description "unbound_exporter" \
/unbound_exporter/unbound_exporter=/usr/local/bin/unbound_exporter


EOF