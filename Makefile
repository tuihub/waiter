init:
	cd rust && make init
	cargo install flutter_rust_bridge_codegen --version 2.7.0
	npm install @openapitools/openapi-generator-cli -g

generate_rust_bridge:
	flutter_rust_bridge_codegen generate

format:
	cd rust && make format
	dart fix --apply
	dart format .

generate_dart:
	dart run build_runner build

generate_bangumi_api:
	openapi-generator-cli generate -i https://raw.githubusercontent.com/bangumi/api/refs/heads/master/open-api/v0.yaml -g dart-dio -o packages/bangumi_api --additional-properties=pubName=bangumi_api
	cd packages/bangumi_api && dart pub get && dart run build_runner build

generate: generate_rust_bridge generate_dart

watch:
	dart run build_runner watch