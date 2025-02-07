import 'package:dio/dio.dart';

class AppScrapedInfo {
  final String id;
  final String name;
  final String? shortDescription;
  final String? iconImageUrl;
  final String? backgroundImageUrl;
  final String? coverImageUrl;
  final String? description;
  final String? releaseDate;
  final String? developer;
  final String? publisher;

  const AppScrapedInfo({
    required this.id,
    required this.name,
    this.shortDescription,
    this.iconImageUrl,
    this.backgroundImageUrl,
    this.coverImageUrl,
    this.description,
    this.releaseDate,
    this.developer,
    this.publisher,
  });
}

abstract class AppScrapeSource {
  Future<AppScrapedInfo?> searchAppByName(String name);
  Future<AppScrapedInfo?> searchAppById(String id);
}

class UserAgentInterceptor extends Interceptor {
  final String userAgent;

  UserAgentInterceptor(this.userAgent);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['User-Agent'] = userAgent;
    super.onRequest(options, handler);
  }
}
