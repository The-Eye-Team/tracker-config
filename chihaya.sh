mkdir chihaya
export GOPATH=$(pwd)/chihaya/
go get -t -u github.com/simon987/chihaya/...
find . -type f -name "*.go" -print0 | xargs -0 sed -i '' -e 's/github.com\/Sirupsen\/logrus/github.com\/sirupsen\/logrus/g'
find . -type f -name "*.go" -print0 | xargs -0 sed -i '' -e 's/github.com\/chihaya\/chihaya/github.com\/simon987\/chihaya/g'
cp server.go chihaya/src/github.com/simon987/chihaya/pkg/prometheus/server.go
go get -t -u github.com/simon987/chihaya/...

$GOPATH/bin/chihaya --config chihaya.yaml
