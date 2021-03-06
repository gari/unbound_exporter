#!/bin/bash

rpm_dist=${1:-el7}

VERSION="v0.3"
RC="1"
DIR="rpm"

docker run -i -v `pwd`:/unbound_exporter gari123/fpm /bin/sh << EOF
set -ex

cd /unbound_exporter

fpm -s dir -n "unbound_exporter" \
-p rpm/ \
-v ${VERSION} \
--iteration ${RC} \
-t rpm --rpm-os linux \
-a x86_64 \
--rpm-dist ${rpm_dist} \
--url "https://github.com/gari/unbound_exporter" \
--license "Apache Software License 2.0" \
--maintainer "Igor Kozlov igor.kozlov@corp.mail.ru" \
--description "unbound_exporter" \
/unbound_exporter/unbound_exporter=/usr/local/bin/unbound_exporter


EOF