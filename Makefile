all: gen_message gen_service

prepare:
	@go install github.com/yoheimuta/protolint/cmd/protolint@latest

lint:
	@protolint lint .

lint_fix:
	@protolint lint -fix .

gen_message:
	@protoc --proto_path=protobuf --go_out=. protobuf/message/*.proto

gen_service:
	@protoc --proto_path=protobuf --go_out=. --go_opt=Mmessage/user.proto=share-proto/generated/message protobuf/rpc/*.proto

.PHONY: gen_message gen_service gen_svc
