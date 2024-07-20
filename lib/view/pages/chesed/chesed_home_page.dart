import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/chesed/chesed_bloc.dart';
import '../../components/toast.dart';
import '../../helper/spacing.dart';
import 'chesed_image_view.dart';
import 'chesed_upload.dart';

class ChesedHome extends StatelessWidget {
  const ChesedHome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocBuilder<ChesedBloc, ChesedState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ink(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: SpacingHelper.defaultBorderRadius,
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
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Colors.transparent,
                            hoverColor: Colors.transparent,
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
                          context
                              .read<ChesedBloc>()
                              .add(ChesedSearchImagesEvent(controller.text));
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
                    itemCount:
                        state.imageUrls != null && state.imageUrls!.isNotEmpty
                            ? state.imageUrls!.length + 1
                            : 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (state.imageUrls != null &&
                          state.imageUrls!.isNotEmpty) {
                        if (index == state.imageUrls!.length) {
                          return Ink(
                            decoration: BoxDecoration(
                              borderRadius: SpacingHelper.defaultBorderRadius,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                            child: const Center(
                              child: Text('没有了'),
                            ),
                          );
                        }
                        final item = state.imageUrls!.elementAt(index);
                        return InkWell(
                            onTap: () {
                              unawaited(Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChesedImageViewWidget(imageUrl: item)),
                              ));
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: SpacingHelper.defaultBorderRadius,
                                image: DecorationImage(
                                  image: ExtendedNetworkImageProvider(
                                    item,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ));
                      }
                      return Ink(
                        decoration: BoxDecoration(
                          borderRadius: SpacingHelper.defaultBorderRadius,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        child: const Center(
                          child: Text('加载中'),
                        ),
                      );
                    },
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
                  builder: (_) {
                    return BlocProvider.value(
                      value: context.read<ChesedBloc>(),
                      child: ChesedUpload(
                        callback: () {
                          const Toast(
                            title: '',
                            message: '上传成功',
                          ).show(context);
                        },
                      ),
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
