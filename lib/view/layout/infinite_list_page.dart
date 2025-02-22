import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../l10n/l10n.dart';
import '../helper/app_bar.dart';

class InfiniteListPage<T> extends StatefulWidget {
  const InfiniteListPage({
    super.key,
    this.title = '',
    required this.loadPage,
    this.doAdd,
    this.onBack,
    this.topWidget,
    this.popupMenuItems,
    required this.itemBuilder,
    this.pagingController,
  });

  final String title;
  final Future<(List<T> items, bool isLastPage)> Function(int pageKey) loadPage;
  final void Function()? doAdd;
  final void Function()? onBack;
  final Widget? topWidget;
  final List<UniversalToolBarItem>? popupMenuItems;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final PagingController<int, T>? pagingController;

  static PagingController<int, F> defaultPagingController<F>() =>
      PagingController<int, F>(
        firstPageKey: 1,
      );

  @override
  State<InfiniteListPage<T>> createState() => _InfiniteListPageState<T>();
}

class _InfiniteListPageState<T> extends State<InfiniteListPage<T>> {
  late PagingController<int, T> _pagingController;

  @override
  void initState() {
    _pagingController = widget.pagingController ??
        InfiniteListPage.defaultPagingController<T>();
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final (items, isLastPage) = await widget.loadPage(pageKey);
      if (isLastPage) {
        _pagingController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(items, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;

      return Scaffold(
        appBar: AppBar(
          shape: UniversalUI.of(context).defaultShape,
          backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
          leading: AppBarHelper.defaultMainLeading(context,
              onPressed: widget.onBack),
          title: Text(widget.title),
          actions: [
            Container(
              width: width / 2,
              padding: const EdgeInsets.only(right: 8),
              child: UniversalToolBar(
                mainAxisAlignment: MainAxisAlignment.end,
                primaryItems: [
                  if (widget.doAdd != null)
                    UniversalToolBarItem(
                      icon: UniversalIcon(context).add,
                      onPressed: widget.doAdd,
                      label: Text(S.of(context).add),
                    ),
                  UniversalToolBarItem(
                    icon: UniversalIcon(context).refresh,
                    onPressed: _pagingController.refresh,
                    label: Text(S.of(context).refresh),
                  ),
                ],
                secondaryItems: [
                  if (widget.doAdd != null)
                    UniversalToolBarItem(
                      icon: UniversalIcon(context).add,
                      onPressed: widget.doAdd,
                      label: Text(S.of(context).add),
                    ),
                  if (widget.popupMenuItems != null) ...widget.popupMenuItems!,
                ],
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
            _pagingController.refresh,
          ),
          child: Column(
            children: [
              if (widget.topWidget != null) widget.topWidget!,
              Expanded(
                child: DynMouseScroll(builder: (context, controller, physics) {
                  return PagedListView.separated(
                    scrollController: controller,
                    physics: physics,
                    pagingController: _pagingController,
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.all(UniversalUI.of(context).defaultPadding),
                    separatorBuilder: (context, index) => SizedBox(
                      height: UniversalUI.of(context).defaultPadding,
                    ),
                    builderDelegate: PagedChildBuilderDelegate<T>(
                      itemBuilder: widget.itemBuilder,
                      firstPageErrorIndicatorBuilder: (context) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: SpacingHelper.listSpacing(
                            height: UniversalUI.of(context).defaultPadding,
                            children: [
                              Text(S.of(context).loadingFailed),
                              Text(_pagingController.error.toString()),
                              UniversalFilledButton(
                                onPressed:
                                    _pagingController.retryLastFailedRequest,
                                child: Text(S.of(context).retry),
                              ),
                            ],
                          ),
                        ),
                      ),
                      newPageErrorIndicatorBuilder: (context) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: SpacingHelper.listSpacing(
                            height: UniversalUI.of(context).defaultPadding,
                            children: [
                              Text(S.of(context).loadingFailed),
                              Text(_pagingController.error.toString()),
                              UniversalFilledButton(
                                onPressed:
                                    _pagingController.retryLastFailedRequest,
                                child: Text(S.of(context).retry),
                              ),
                            ],
                          ),
                        ),
                      ),
                      firstPageProgressIndicatorBuilder: (context) =>
                          const Center(
                        child: UniversalLinearProgressIndicator(),
                      ),
                      newPageProgressIndicatorBuilder: (context) =>
                          const Center(
                        child: UniversalCircularProgressIndicator(),
                      ),
                      noItemsFoundIndicatorBuilder: (context) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: SpacingHelper.listSpacing(
                            height: UniversalUI.of(context).defaultPadding,
                            children: [
                              Text(S.of(context).emptyContent),
                              if (widget.doAdd != null)
                                UniversalFilledButton(
                                  onPressed: widget.doAdd,
                                  child: Text(S.of(context).add),
                                ),
                            ],
                          ),
                        ),
                      ),
                      noMoreItemsIndicatorBuilder: (context) => Center(
                        child: Text(S.of(context).noMoreContent),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
