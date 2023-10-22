import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:webfeed_revised/domain/rss_feed.dart';

import '../../../../../../model/common_model.dart';
import '../../../../../../model/yesod_model.dart';
import '../../../../../common/api/api_helper.dart';

part 'yesod_add_event.dart';
part 'yesod_add_state.dart';

class YesodAddBloc extends Bloc<YesodAddEvent, YesodAddState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  YesodAddBloc() : super(const YesodAddInitial()) {
    on<YesodAddEvent>((event, emit) async {
      if (event is YesodUrlValidateEvent) {
        emit(const YesodAddValidate());
      }
      if (event is YesodUrlCheckEvent) {
        if (state is YesodAddSecondState) {
          emit(YesodAddInitial(
            url: event.url,
          ));
        }
        emit(state.copyWith(
          url: event.url,
          loadState: LoadState.loading,
        ));
        try {
          final url = Uri.parse(event.url);
          final response = await http.get(url);
          final data = RssFeed.parse(response.body);

          debugPrint(data.title);

          debugPrint(data.description);

          final subscription = RssSubscription(
              title: data.title!,
              link: event.url,
              description: data.description!,
              iconUrl: '');

          final item = data.items!.first;

          String? imgUrl;

          String description = '';
          if (item.description != null) {
            try {
              final doc = parse(item.description);
              final imgElements = doc.getElementsByTagName('img');
              if (imgElements.isNotEmpty) {
                imgUrl = imgElements.first.attributes['src'];
              }
              doc.querySelectorAll('p,h1,h2,h3,h4,h5,span').forEach((element) {
                description = description + element.text;
              });
              description.replaceAll('\n', ' ');
              debugPrint(description);
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
          emit(YesodAddFirstState(
            example: example,
            url: event.url,
          ));
        } on Exception catch (e) {
          emit(YesodAddFirstState(
            example: null,
            url: event.url,
            errorMessage: '解析失败, $e',
            loadState: LoadState.failure,
          ));
        }
      }
      if (event is YesodAddSecondStageEvent) {
        emit(
          YesodAddSecondState(
            url: event.url,
            name: event.name,
            refreshInterval: 60,
            category: '',
            enabled: true,
          ),
        );
      }
      if (state is YesodAddSecondState) {
        if (event is ChangeNameEvent) {
          emit((state as YesodAddSecondState).copyWith(name: event.name));
        }
        if (event is ChangeIntervalEvent) {
          emit((state as YesodAddSecondState)
              .copyWith(refreshInterval: event.interval));
        }
        if (event is ChangeCategoryEvent) {
          emit((state as YesodAddSecondState)
              .copyWith(category: event.category));
        }
        if (event is ChangeEnabledEvent) {
          emit((state as YesodAddSecondState).copyWith(enabled: event.enabled));
        }
      }
      if (event is YesodFeedConfigEvent) {
        emit(state.copyWith(
          loadState: LoadState.loading,
        ));
        try {
          await GetIt.I<ApiHelper>()
              .doRequest<CreateFeedConfigResponse>((client, option) {
            return client.createFeedConfig(
              CreateFeedConfigRequest(
                config: FeedConfig(
                  name: event.name,
                  feedUrl: event.url,
                  source: FeedConfigSource.FEED_CONFIG_SOURCE_COMMON,
                  status: event.enabled
                      ? FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE
                      : FeedConfigStatus.FEED_CONFIG_STATUS_SUSPEND,
                  pullInterval: $duration.Duration(
                    seconds: $fixnum.Int64(event.refreshInterval * 60),
                  ),
                  category: event.category,
                ),
              ),
              options: option,
            );
          });
        } catch (e) {
          emit(state.copyWith(
            errorMessage: '添加失败, $e',
            loadState: LoadState.failure,
          ));
        }
        emit(state.copyWith(
          loadState: LoadState.success,
        ));
      }
    });
  }
}
