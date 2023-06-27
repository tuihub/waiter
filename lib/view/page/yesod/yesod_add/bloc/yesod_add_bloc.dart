import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favicon/favicon.dart';
import 'package:http/http.dart' as http;
import 'package:waitress/common/base/model/yesod_model.dart';
import 'package:webfeed_revised/domain/rss_feed.dart';
import 'package:html/parser.dart' show parse;

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

        print(data.title);

        print(data.description);
        var icon = await FaviconFinder.getBest(Uri.parse(event.url).origin);
        print(icon);

        final subscription = RssSubscription(
            title: data.title!,
            link: event.url,
            description: data.description!,
            iconUrl: icon!.url);

        final item = data.items!.first;

        String? imgUrl = null;

        String description = "";
        if (item.description != null) {
          try {
            final doc = parse(item.description!);
            final imgElements = doc.getElementsByTagName("img");
            if (imgElements.isNotEmpty) {
              imgUrl = imgElements.first.attributes["src"];
            }
            doc.querySelectorAll('p,h1,h2,h3,h4,h5,span').forEach((element) {
              description = description + element.text;
            });
            description.replaceAll("\n", " ");
            print(description);
          } catch (e) {
            description = item.description!;
          }
        }

        final example = RssPostItem(
          title: item.title,
          link: item.link,
          description: description,
          subscription: subscription,
          image: imgUrl,
        );
        emit(YesodUrlCheckSuccess(
          example: example,
          url: event.url,
        ));
      }
    });
  }
}
