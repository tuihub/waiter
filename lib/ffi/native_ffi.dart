import 'dart:ffi';
import 'dart:io';

import 'ffi_model.dart';
import 'rust_ffi/rust_ffi.dart';

class NativeFFI {
  NativeFFI._();

  static DynamicLibrary? _dyLib;

  static DynamicLibrary get dyLib {
    if (_dyLib != null) return _dyLib!;

    const base = 'rust_ffi';
    if (Platform.isIOS) {
      _dyLib = DynamicLibrary.process();
    } else if (Platform.isMacOS) {
      _dyLib = DynamicLibrary.executable();
    } else if (Platform.isAndroid) {
      _dyLib = DynamicLibrary.open('lib$base.so');
    } else if (Platform.isWindows) {
      _dyLib = DynamicLibrary.open('$base.dll');
    } else {
      throw Exception('DynamicLibrary初始化失败');
    }

    return _dyLib!;
  }
}

class FFI extends FFIBase {
  static final _ffi = RustFfiImpl(NativeFFI.dyLib);

  @override
  Future<(int, int, bool)> processRunner(
    String name,
    String executePath,
    String monitorPath,
    String workingDir,
    int sleepCount,
    int sleepMillis,
  ) async {
    return _ffi.processRunner(
      name: name,
      executePath: executePath,
      monitorPath: monitorPath,
      workingDir: workingDir,
      sleepCount: sleepCount,
      sleepMillis: sleepMillis,
      mode: TraceMode.Simple,
    );
  }
}
