import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favicon/favicon.dart';
import 'package:http/http.dart' as http;
import 'package:waitress/common/base/model/yesod_model.dart';
import 'package:webfeed_revised/domain/rss_feed.dart';

part 'yesod_add_event.dart';
part 'yesod_add_state.dart';

class YesodAddBloc extends Bloc<YesodAddEvent, YesodAddState> {
  YesodAddBloc() : super(YesodAddInitial()) {
    on<YesodAddEvent>((event, emit) async {
      if (event is YesodUrlCheckEvent) {
        emit(YesodUrlCheckLoading(url: event.url));
        var url = Uri.parse(event.url);
        var response = await http.get(url);
        var data = RssFeed.parse(response.body);

        print(data.title); // Flutter - Beautiful native apps in record time

        print(data
            .description); // Flutter is Google's UI toolkit for crafting beautiful...

        var icon = await FaviconFinder.getBest(event.url);
        print(icon);

        final subscription = RssSubscription(
            title: data.title!,
            link: event.url,
            description: data.description!,
            iconUrl: icon!.url);

        final item = data.items!.first;
        final example = RssPostItem(
          title: item.title!,
          link: item.link!,
          description: item.description!,
          updateTime: item.pubDate!.toString(),
          subscription: subscription,
        );
        emit(YesodUrlCheckSuccess(
          example: example,
          url: event.url,
        ));
      }
    });
  }
}
