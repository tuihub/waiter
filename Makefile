init:
	cd rust_ffi && make init
	cargo install flutter_rust_bridge_codegen

generate_rust_bridge:
	flutter_rust_bridge_codegen -r rust_ffi/src/api.rs -d lib/ffi/rust_ffi/rust_ffi.dart

format:
	cd rust_ffi && make format
	dart fix --apply
	dart format .