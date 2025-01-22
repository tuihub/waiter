import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dao/dao.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../common/bloc_event_status_mixin.dart';
import '../../model/common_model.dart';
import '../../model/yesod_model.dart';
import '../../repo/yesod_repo.dart';
import '../../service/di_service.dart';
import '../../service/librarian_service.dart';

part 'yesod_bloc.mapper.dart';
part 'yesod_event.dart';
part 'yesod_state.dart';

class YesodBloc extends Bloc<YesodEvent, YesodState> {
  final YesodRepo _repo;
  final DIProvider<LibrarianService> _api;

  static Future<YesodBloc> init(YesodRepo repo, Stream<ServerID> serverID,
      DIProvider<LibrarianService> api) async {
    try {
      final initialState = YesodState();
      final instance = YesodBloc._(initialState, repo, api);
      serverID.listen((event) {
        instance.add(_YesodSwitchServerEvent(event));
      });
      return instance;
    } catch (e) {
      debugPrint(e.toString());
      return YesodBloc._(YesodState(), repo, api);
    }
  }

  YesodBloc._(super.initialState, this._repo, this._api) {
    on<_YesodSwitchServerEvent>((event, emit) async {
      emit(YesodState());
    });

    on<YesodInitEvent>((event, emit) async {
      if (state.feedConfigs == null) {
        add(YesodFeedConfigLoadEvent(event.context));
      }
      if (state.feedActionSets == null) {
        add(YesodFeedActionSetLoadEvent(event.context));
      }
      if (state.feedItemDigests == null) {
        add(YesodFeedItemDigestsLoadEvent(event.context, 1));
      }
      if (state.feedCategories == null) {
        add(YesodFeedCategoriesLoadEvent(event.context));
      }
      if (state.listConfig == null) {
        final config = await _repo.getFeedItemListConfig();
        emit(state.copyWith(listConfig: config));
      }
    }, transformer: restartable());

    on<YesodFeedConfigLoadEvent>((event, emit) async {
      final List<ListFeedConfigsResponse_FeedWithConfig> configs =
          await _repo.getFeedConfigs(event.context);
      emit(YesodFeedConfigLoadState(state, EventStatus.processing));

      final resp = await _api.get(DIService.instance.currentServer).doRequest(
            (client) => client.listFeedConfigs,
            ListFeedConfigsRequest(
              paging: PagingRequest(
                pageSize: Int64(1),
                pageNum: Int64(1),
              ),
            ),
          );
      if (resp case Err()) {
        emit(YesodFeedConfigLoadState(
            state.copyWith(
              feedConfigs: configs,
            ),
            EventStatus.failed,
            msg: resp.error));
        return;
      }

      final totalSize = resp.unwrap().paging.totalSize.toInt();
      const pageSize = 100;
      var failCount = 0;

      for (var pageNum = 1; (pageNum - 1) * pageSize < totalSize; pageNum++) {
        final resp = await _api.get(DIService.instance.currentServer).doRequest(
              (client) => client.listFeedConfigs,
              ListFeedConfigsRequest(
                paging: PagingRequest(
                  pageSize: Int64(pageSize),
                  pageNum: Int64(pageNum),
                ),
              ),
            );
        if (resp case Ok()) {
          configs.addAll(resp.v.feedsWithConfig);
        } else {
          failCount++;
        }
      }

      emit(YesodFeedConfigLoadState(
        state.copyWith(feedConfigs: configs),
        failCount == 0 ? EventStatus.success : EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodFeedConfigAddEvent>((event, emit) async {
      emit(YesodFeedConfigAddState(
        state,
        EventStatus.processing,
      ));
      final resp = await _api.get(DIService.instance.currentServer).doRequest(
            (client) => client.createFeedConfig,
            CreateFeedConfigRequest(
              config: event.config,
            ),
          );
      if (resp case Err()) {
        emit(YesodFeedConfigAddState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }
      final configs = [
        ListFeedConfigsResponse_FeedWithConfig(
          config: event.config..id = resp.unwrap().id,
          feed: null,
        )
      ];
      configs.addAll(state.feedConfigs ?? []);
      await _repo.setFeedConfigs(event.context, configs);
      add(YesodFeedConfigLoadEvent(event.context));
      emit(YesodFeedConfigAddState(
        state.copyWith(feedConfigs: configs),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodFeedConfigEditEvent>((event, emit) async {
      emit(YesodFeedConfigEditState(
        state,
        EventStatus.processing,
      ));
      final resp = await _api.get(DIService.instance.currentServer).doRequest(
            (client) => client.updateFeedConfig,
            UpdateFeedConfigRequest(
              config: event.config,
            ),
          );
      if (resp case Err()) {
        emit(YesodFeedConfigEditState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }
      final configs = state.feedConfigs ?? [];
      await _repo.setFeedConfigs(event.context, configs);
      add(YesodFeedConfigLoadEvent(event.context));
      emit(YesodFeedConfigEditState(
        state.copyWith(feedConfigs: configs),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodFeedActionSetLoadEvent>((event, emit) async {
      emit(YesodFeedActionSetLoadState(
        state,
        EventStatus.processing,
      ));
      final resp = await _api.get(DIService.instance.currentServer).doRequest(
            (client) => client.listFeedActionSets,
            ListFeedActionSetsRequest(
              paging: PagingRequest(
                pageSize: Int64(1),
                pageNum: Int64(1),
              ),
            ),
          );
      if (resp case Err()) {
        emit(YesodFeedActionSetLoadState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }

      final totalSize = resp.unwrap().paging.totalSize.toInt();
      const pageSize = 100;
      var failCount = 0;

      final List<FeedActionSet> sets = [];
      for (var pageNum = 1; (pageNum - 1) * pageSize < totalSize; pageNum++) {
        final resp = await _api.get(DIService.instance.currentServer).doRequest(
              (client) => client.listFeedActionSets,
              ListFeedActionSetsRequest(
                paging: PagingRequest(
                  pageSize: Int64(pageSize),
                  pageNum: Int64(pageNum),
                ),
              ),
            );
        if (resp case Ok()) {
          sets.addAll(resp.v.actionSets);
        } else {
          failCount++;
        }
      }
      emit(YesodFeedActionSetLoadState(
        state.copyWith(feedActionSets: sets),
        failCount == 0 ? EventStatus.success : EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodFeedActionSetAddEvent>((event, emit) async {
      emit(YesodFeedActionSetAddState(
        state,
        EventStatus.processing,
      ));
      final resp = await _api.get(DIService.instance.currentServer).doRequest(
            (client) => client.createFeedActionSet,
            CreateFeedActionSetRequest(
              actionSet: event.set,
            ),
          );
      if (resp case Err()) {
        emit(YesodFeedActionSetAddState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }
      final sets = [
        event.set,
      ];
      sets.addAll(state.feedActionSets ?? []);
      add(YesodFeedActionSetLoadEvent(event.context));
      emit(YesodFeedActionSetAddState(
        state.copyWith(feedActionSets: sets),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodFeedActionSetEditEvent>((event, emit) async {
      emit(YesodFeedActionSetEditState(
        state,
        EventStatus.processing,
      ));
      final resp = await _api.get(DIService.instance.currentServer).doRequest(
            (client) => client.updateFeedActionSet,
            UpdateFeedActionSetRequest(
              actionSet: event.set,
            ),
          );
      if (resp case Err()) {
        emit(YesodFeedActionSetEditState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }
      final sets = state.feedActionSets ?? [];
      add(YesodFeedActionSetLoadEvent(event.context));
      emit(YesodFeedActionSetEditState(
        state.copyWith(feedActionSets: sets),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodFeedItemDigestsLoadEvent>((event, emit) async {
      final refresh = event.refresh ?? false;
      const pageSize = 20;
      final pageNum = refresh ? 1 : event.pageNum;

      emit(YesodFeedItemDigestLoadState(
        state,
        EventStatus.processing,
      ));
      final listConfig = await _repo.getFeedItemListConfig();
      final resp = await _api.get(DIService.instance.currentServer).doRequest(
            (client) => client.listFeedItems,
            ListFeedItemsRequest(
              paging: PagingRequest(
                pageSize: Int64(pageSize),
                pageNum: Int64(pageNum),
              ),
              feedIdFilter: listConfig.feedIdFilter
                  ?.map((e) => InternalID(id: Int64.parseInt(e))),
              categoryFilter: listConfig.categoryFilter,
            ),
          );
      if (resp case Err()) {
        emit(YesodFeedItemDigestLoadState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }
      final List<FeedItemDigest> digests =
          refresh ? [] : state.feedItemDigests ?? [];
      digests.addAll(resp.unwrap().items);
      emit(YesodFeedItemDigestLoadState(
        state.copyWith(feedItemDigests: digests),
        EventStatus.success,
        currentPage: pageNum,
        maxPage: ((resp.unwrap().paging.totalSize.toInt() - 1) ~/ pageSize) + 1,
      ));
    }, transformer: droppable());

    on<YesodFeedItemLoadEvent>((event, emit) async {
      emit(YesodFeedItemLoadState(
        state,
        EventStatus.processing,
      ));
      FeedItem? item;
      final resp = await _api.get(DIService.instance.currentServer).doRequest(
            (client) => client.getFeedItem,
            GetFeedItemRequest(
              id: event.id,
            ),
          );
      if (resp case Err()) {
        emit(YesodFeedItemLoadState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      } else {
        item = resp.unwrap().item;
        await _repo.setFeedItem(event.context, event.id, item);
      }
      emit(YesodFeedItemLoadState(state, EventStatus.success, feedItem: item));
    }, transformer: droppable());

    on<YesodFeedCategoriesLoadEvent>((event, emit) async {
      emit(YesodFeedCategoriesLoadState(
        state,
        EventStatus.processing,
      ));
      final resp = await _api.get(DIService.instance.currentServer).doRequest(
            (client) => client.listFeedCategories,
            ListFeedCategoriesRequest(),
          );
      if (resp case Err()) {
        emit(YesodFeedCategoriesLoadState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }
      emit(YesodFeedCategoriesLoadState(
        state.copyWith(feedCategories: resp.unwrap().categories),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodFeedItemReadEvent>((event, emit) async {
      await _api.get(DIService.instance.currentServer).doRequest(
            (client) => client.readFeedItem,
            ReadFeedItemRequest(id: event.id),
          );
    });

    on<YesodFeedItemListConfigSetEvent>((event, emit) async {
      await _repo.setFeedItemListConfig(event.config);
      add(YesodFeedItemDigestsLoadEvent(event.context, 1, refresh: true));
      emit(state.copyWith(listConfig: event.config));
    });
  }

  Future<FeedItem?> getFeedItem(InternalID id) async {
    try {
      final item = await _repo.getFeedItem(
          EventContext(DIService.instance.currentServer), id);
      if (item == null) {
        add(YesodFeedItemLoadEvent(null, id));
      }
      return item;
    } catch (e) {
      debugPrint(e.toString());
      add(YesodFeedItemLoadEvent(null, id));
      return null;
    }
  }
}
