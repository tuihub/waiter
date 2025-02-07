import 'package:bangumi_api/bangumi_api.dart';
import 'package:test/test.dart';

import 'source.dart';

class BangumiSource extends AppScrapeSource {
  final BangumiApi _api;

  BangumiSource()
      : _api = BangumiApi(
          basePathOverride: 'https://api.bgm.tv',
          interceptors: [
            UserAgentInterceptor(
                'tuihub/waiter (https://github.com/tuihub/waiter)'),
            OAuthInterceptor(),
            BasicAuthInterceptor(),
            BearerAuthInterceptor(),
            ApiKeyAuthInterceptor(),
          ],
        );

  @override
  Future<AppScrapedInfo?> searchAppByName(String name) async {
    final resp = await _api.getDefaultApi().searchSubjects(
          searchSubjectsRequest: SearchSubjectsRequest(
            keyword: name,
            sort: SearchSubjectsRequestSortEnum.match,
            filter: SearchSubjectsRequestFilter(
              type: [SubjectType.Game],
            ),
          ),
        );
    if (resp.data != null && resp.data!.data != null) {
      final subject = resp.data!.data!.first;
      return AppScrapedInfo(
        id: subject.id.toString(),
        name: subject.name,
        shortDescription: subject.summary,
        iconImageUrl: subject.images.grid,
        backgroundImageUrl: subject.images.large,
        coverImageUrl: subject.images.common,
        description: subject.summary,
      );
    }
    return null;
  }

  @override
  Future<AppScrapedInfo?> searchAppById(String id) async {
    final resp =
        await _api.getDefaultApi().getSubjectById(subjectId: int.parse(id));
    if (resp.data != null) {
      final subject = resp.data!;
      return AppScrapedInfo(
        id: subject.id.toString(),
        name: subject.name,
        shortDescription: subject.summary,
        iconImageUrl: subject.images.grid,
        backgroundImageUrl: subject.images.large,
        coverImageUrl: subject.images.common,
        description: subject.summary,
      );
    }
    return null;
  }
}

void main() {
  test('searchAppByName', () async {
    const name = 'The Binding of Isaac';
    const expectedId = '45260';
    final info = await BangumiSource().searchAppByName(name);
    expect(info!.id, expectedId);
  });
}
