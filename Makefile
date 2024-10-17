init:
	cd rust && make init
	cargo install flutter_rust_bridge_codegen --version 2.5.0

generate_rust_bridge:
	flutter_rust_bridge_codegen generate

format:
	cd rust && make format
	dart fix --apply
	dart format .

generate_dart:
	dart run build_runner build