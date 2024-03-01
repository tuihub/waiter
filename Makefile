init:
	cd rust_ffi && make init
	cargo install flutter_rust_bridge_codegen --version 1.82.1

generate_rust_bridge:
	flutter_rust_bridge_codegen -r rust_ffi/src/api.rs -d lib/ffi/rust_ffi/rust_ffi.dart

format:
	cd rust_ffi && make format
	dart fix --apply
	dart format .

generate_dart:
	dart run build_runner build