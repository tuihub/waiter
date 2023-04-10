init:
	cargo install flutter_rust_bridge_codegen
	flutter pub add --dev ffigen && flutter pub add ffi

generate_rust_bridge:
	flutter_rust_bridge_codegen -r rust_ffi/src/api.rs -d lib/ffi/rust_ffi/rust_ffi.dart 