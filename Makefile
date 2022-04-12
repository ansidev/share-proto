all: gen_message gen_service

prepare:
	@go install github.com/yoheimuta/protolint/cmd/protolint@latest

lint:
	@protolint lint .

lint_fix:
	@protolint lint .

gen_message:
	@protoc --go_out=plugins=grpc:.. protobuf/message/*.proto

gen_service:
	@protoc --proto_path=protobuf --go_out=plugins=grpc:.. protobuf/rpc/*.proto

.PHONY: gen_message gen_service