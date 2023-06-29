import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favicon/favicon.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:waitress/common/base/model/common_model.dart';
import 'package:waitress/common/base/model/yesod_model.dart';
import 'package:waitress/common/client/api_helper.dart';
import 'package:webfeed_revised/domain/rss_feed.dart';

import 'package:html/parser.dart' show parse;
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;

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
          emit(YesodAddFirstState(
            example: example,
            url: event.url,
          ));
        } on Exception catch (e) {
          emit(state.copyWith(
            errorMessage: "解析失败, ${e.toString()}",
            loadState: LoadState.failure,
          ));
        }
      }
      if (event is YesodAddSecondStageEvent) {
        emit(
          YesodAddSecondState(
            url: event.url,
            name: event.name,
            iconUrl: event.iconUrl,
            refreshInterval: 60,
            enabled: true,
          ),
        );
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
                    seconds: $fixnum.Int64(event.refreshInterval),
                  ),
                ),
              ),
              options: option,
            );
          });
        } catch (e) {
          emit(state.copyWith(
            errorMessage: "添加失败, ${e.toString()}",
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
