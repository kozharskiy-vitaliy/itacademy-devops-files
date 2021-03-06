export GOPATH=$WORKSPACE
export PATH="$PATH:$(go env GOPATH)/bin"

go get github.com/tools/godep
go get github.com/smartystreets/goconvey
go get github.com/GeertJohan/go.rice/rice
go get github.com/wickett/word-cloud-generator/wordyapi

sed -i 's/1.DEVELOPMENT/1.$BUILD_NUMBER/g' ./rice-box.go

GOOS=linux GOARCH=amd64 go build -o ./artifacts/word-cloud-generator -v .

md5sum artifacts/word-cloud-generator
gzip artifacts/word-cloud-generator
ls -l artifacts/
