import 'dart:typed_data';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:universal_io/io.dart';

class FileHelper {
  static Future<void> downloadImage(String url, String savePath) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final file = File(savePath);
      if (await _isImageValid(response.bodyBytes)) {
        await file.writeAsBytes(response.bodyBytes);
        return;
      }
    }
    throw Exception('Failed to download file');
  }

  static Future<bool> _isImageValid(List<int> rawList) async {
    final uInt8List =
        rawList is Uint8List ? rawList : Uint8List.fromList(rawList);

    try {
      final codec = await instantiateImageCodec(uInt8List, targetWidth: 32);
      final frameInfo = await codec.getNextFrame();
      return frameInfo.image.width > 0;
    } catch (e) {
      return false;
    }
  }
}
