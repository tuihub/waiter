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

enum TraceMode {
  Simple,
  ByName,
}
