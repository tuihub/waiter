abstract class FFIBase {
  Future<(int, int, bool)> processRunner(
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
