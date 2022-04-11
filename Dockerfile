from golang:1.17-buster as builder
arg ETCD_VERSION
run git clone -b v${ETCD_VERSION} --depth=1 https://github.com/etcd-io/etcd.git /src
workdir /src
run ./build.sh

from debian:buster
copy --from=builder /src/bin/* /usr/local/bin/
entrypoint ["etcd"]
