final class UrlHelper {
  static bool isValidUrl(String url) {
    try {
      Uri.parse(url);
    } catch (e) {
      return false;
    }
    return true;
  }
}
