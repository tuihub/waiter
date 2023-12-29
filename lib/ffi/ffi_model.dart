import 'rust_ffi/rust_ffi.dart';

abstract class FFIBase {
  Future<(int, int, bool)> processRunner(
    TraceMode mode,
    String name,
    String executePath,
    String monitorPath,
    String workingDir,
    int sleepCount,
    int sleepMillis,
  ) {
    throw UnimplementedError();
  }
}
