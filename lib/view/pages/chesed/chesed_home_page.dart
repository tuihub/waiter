import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/chesed.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import '../../../bloc/api_request/api_request_bloc.dart';
import 'chesed_image_view.dart';
import 'chesed_upload.dart';

class ChesedHome extends StatelessWidget {
  final controller = TextEditingController();
  final paging = PagingRequest(pageNum: 1, pageSize: 50);

  ChesedHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiRequestBloc, ApiRequestState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is! ChesedState) {
          context
              .read<ApiRequestBloc>()
              .add(ChesedLoadEvent(SearchImagesRequest(paging: paging)));
        }
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ink(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                child: LayoutBuilder(builder: (context, constrains) {
                  final width = constrains.maxWidth / 2; // 父级宽度
                  const height = 35.0;
                  return Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(height)),
                    child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            hintText: '搜索',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                            contentPadding:
                                const EdgeInsets.only(bottom: height / 3),
                            border: InputBorder.none,
                            icon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                child: Icon(
                                  Icons.search,
                                  size: 18,
                                  color: Theme.of(context).primaryColor,
                                )),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.close,
                                size: 17,
                              ),
                              onPressed: () {
                                controller.text = '';
                              },
                              splashColor: Theme.of(context).primaryColor,
                            )),
                        onEditingComplete: () {
                          context.read<ApiRequestBloc>().add(ChesedLoadEvent(
                              SearchImagesRequest(
                                  keywords: controller.text, paging: paging)));
                        }),
                  );
                }),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.zero,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 256),
                    itemBuilder: (BuildContext context, int index) {
                      if (state is ChesedLoadDone) {
                        if (index == state.resp.length) {
                          return Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                            child: const Center(
                              child: Text('没有了'),
                            ),
                          );
                        }
                        final item = state.resp.elementAt(index);
                        return InkWell(
                            onTap: () {
                              unawaited(Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChesedImageViewWidget(
                                        imageUrl: item.downloadUrl)),
                              ));
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    item.downloadUrl,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ));
                      }
                      return Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        child: const Center(
                          child: Text('加载中'),
                        ),
                      );
                    },
                    itemCount:
                        state is ChesedLoadDone ? state.resp.length + 1 : 1,
                  ),
                ),
              ),
              const Row(
                children: [
                  Expanded(child: SizedBox()),
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              unawaited(
                showDialog<void>(
                  context: context,
                  builder: (context) {
                    return ChesedUpload(
                      callback: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('上传成功'),
                            action: SnackBarAction(
                              label: '关闭',
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
            child: const Icon(Icons.upload),
          ),
        );
      },
    );
  }
}
