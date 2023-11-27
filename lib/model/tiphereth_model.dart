class ServerInformation {
  ServerInformation(
      {required this.sourceCodeAddress,
      required this.buildVersion,
      required this.buildDate,
      required this.protocolVersion});

  final String sourceCodeAddress;
  final String buildVersion;
  final String buildDate;
  final String protocolVersion;
}
