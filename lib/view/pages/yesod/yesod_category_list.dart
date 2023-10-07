import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../bloc/api_request/api_request_bloc.dart';
import '../../../common/api/api_mixins.dart';
import '../../components/expand_rail_tile.dart';
import '../../components/rail_tile.dart';

class YesodCategoryListPage extends StatefulWidget {
  const YesodCategoryListPage({super.key, required this.selectedAppID});

  final String selectedAppID;

  @override
  State<YesodCategoryListPage> createState() => _YesodCategoryListPageState();
}

class _YesodCategoryListPageState extends State<YesodCategoryListPage>
    with
        SingleRequestMixin<YesodCategoryListPage,
            ListFeedConfigCategoriesResponse> {
  @override
  void initState() {
    super.initState();
    loadLibrary();
  }

  Widget _buildStatePage() {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isSuccess) {
      return response.getData().categories.isEmpty
          ? const Center(
              child: Text(''),
            )
          : _CategoryList(
              data: response.getData(),
              selectedAppID: widget.selectedAppID,
            );
    }
    if (isError) {
      return Center(
        child: Text('加载失败: ${response.error}'),
      );
    }
    return const SizedBox();
  }

  void loadLibrary() {
    unawaited(doRequest(request: (client, option) {
      return client.listFeedConfigCategories(
        ListFeedConfigCategoriesRequest(),
        options: option,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiRequestBloc, ApiRequestState>(
      listener: (context, state) {
        if (state is GeburaRefreshLibrary) {
          loadLibrary();
        }
      },
      builder: (context, state) {
        return _buildStatePage();
      },
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    required this.data,
    required this.selectedAppID,
  });

  final ListFeedConfigCategoriesResponse data;
  final String selectedAppID;

  @override
  Widget build(BuildContext context) {
    return ExpandRailTile(
      title: const Text(
        'Category',
      ),
      childrenPadding: const EdgeInsets.only(left: 12),
      children: [
        for (final category in data.categories)
          RailTile(
            selected: category == selectedAppID,
            onTap: () {},
            title: Text(category == '' ? '未分类' : category),
          ),
      ],
    );
  }
}
