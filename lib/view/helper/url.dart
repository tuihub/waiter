final class UrlHelper {
  static bool isValidUrl(String url) {
    if (url.isEmpty) {
      return false;
    }
    try {
      Uri.parse(url);
    } catch (e) {
      return false;
    }
    return true;
  }
}
