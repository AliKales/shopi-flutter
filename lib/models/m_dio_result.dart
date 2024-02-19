final class MDioResult {
  final int status;
  final Map<String, dynamic> data;

  MDioResult({required this.status, required this.data});

  bool get isOk {
    return status == 200;
  }
}
