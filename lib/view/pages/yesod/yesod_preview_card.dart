import 'dart:ui' as ui;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../model/yesod_model.dart';
import '../../../route.dart';
import '../../helper/spacing.dart';
import '../image_viewer.dart';

class YesodPreviewCard extends StatelessWidget {
  const YesodPreviewCard({
    super.key,
    required this.name,
    required this.title,
    required this.callback,
    required this.listType,
    this.iconUrl,
    this.images,
    this.description,
    this.cardBorderRadius,
  });

  final String? iconUrl;
  final String name;
  final List<String>? images;
  final String title;
  final String? description;
  final void Function() callback;
  final FeedItemListType listType;
  final BorderRadius? cardBorderRadius;

  @override
  Widget build(BuildContext context) {
    final cardBorderRadius_ =
        cardBorderRadius ?? SpacingHelper.defaultBorderRadius;
    return LayoutBuilder(builder: (context, constraints) {
      const maxTitleLines = 2;
      const maxDescriptionLines = 3;
      const cardPaddingV = 12.0;
      const cardPaddingH = 12.0;
      const imgPadding = 8;
      const iconSize = 18.0;
      final double leftImageSize =
          listType == FeedItemListType.magazine ? 128 : 0;
      final double bottomImageSize = constraints.biggest.width < 406
          ? (constraints.biggest.width - 2 * imgPadding - 2 * cardPaddingH) / 3
          : 130;
      return Material(
        borderRadius: cardBorderRadius_,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: cardBorderRadius_,
            color: Theme.of(context).cardColor,
          ),
          child: InkWell(
            borderRadius: cardBorderRadius_,
            onTap: callback,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  cardPaddingH, cardPaddingV, cardPaddingH, cardPaddingV),
              child: Row(children: [
                if (listType == FeedItemListType.magazine)
                  Container(
                    width: leftImageSize,
                    padding: const EdgeInsets.only(right: cardPaddingV),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: leftImageSize,
                        maxWidth: leftImageSize,
                      ),
                      child: ClipRRect(
                        borderRadius: SpacingHelper.defaultBorderRadius,
                        child: images != null && images!.isNotEmpty
                            ? _ResizedSpecialImage(images![0])
                            : Container(),
                      ),
                    ),
                  ),
                Container(
                  width: constraints.biggest.width -
                      2 * cardPaddingH -
                      leftImageSize,
                  constraints: listType == FeedItemListType.magazine
                      ? BoxConstraints(
                          minHeight: leftImageSize,
                        )
                      : null,
                  child: ClipRect(
                    child: Flex(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          height: iconSize + 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (iconUrl != null && iconUrl!.isNotEmpty)
                                ExtendedImage.network(
                                  iconUrl!,
                                  height: iconSize,
                                  width: iconSize,
                                ),
                              if (iconUrl != null && iconUrl!.isNotEmpty)
                                const SizedBox(
                                  width: 8,
                                ),
                              SizedBox(
                                height: iconSize + 2,
                                child: Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).disabledColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            title,
                            maxLines: maxTitleLines,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        if (listType != FeedItemListType.table &&
                            description != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              '${description!.length < 200 ? description! : description!.substring(0, 200)}...',
                              maxLines: maxDescriptionLines,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        if (listType == FeedItemListType.card &&
                            images != null &&
                            images!.isNotEmpty)
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: images!.length == 1
                                  ? bottomImageSize * 2
                                  : images!.length <= 3
                                      ? bottomImageSize
                                      : images!.length <= 6
                                          ? bottomImageSize * 2 + imgPadding
                                          : bottomImageSize * 3 +
                                              imgPadding * 2,
                              maxWidth: bottomImageSize * 3 + imgPadding * 2,
                            ),
                            child: ClipRRect(
                              borderRadius: SpacingHelper.defaultBorderRadius,
                              child: images!.length == 1
                                  ? GestureDetector(
                                      onTap: () {
                                        ImageViewerRoute(
                                                0,
                                                images
                                                    ?.map((e) => PicSwiperItem(
                                                        picUrl: e))
                                                    .toList())
                                            .push(context);
                                      },
                                      child: Hero(
                                        tag: images![0],
                                        child: _ResizedSpecialImage(images![0]),
                                      ),
                                    )
                                  : Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        for (var i = 0; i < images!.length; i++)
                                          SizedBox(
                                            width: images!.length == 1
                                                ? bottomImageSize * 3 +
                                                    imgPadding * 2
                                                : images!.length == 2
                                                    ? bottomImageSize * 2
                                                    : bottomImageSize,
                                            height: images!.length <= 3
                                                ? bottomImageSize * 3 +
                                                    imgPadding * 2
                                                : bottomImageSize,
                                            child: GestureDetector(
                                              onTap: () {
                                                ImageViewerRoute(
                                                        i,
                                                        images
                                                            ?.map((e) =>
                                                                PicSwiperItem(
                                                                    picUrl: e))
                                                            .toList())
                                                    .push(context);
                                              },
                                              child: Hero(
                                                tag: images![i],
                                                child: _ResizedSpecialImage(
                                                    images![i]),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
    });
  }
}

class _ResizedSpecialImage extends StatefulWidget {
  const _ResizedSpecialImage(this.url);

  final String url;

  @override
  State<_ResizedSpecialImage> createState() => _ResizedSpecialImageState();
}

class _ResizedSpecialImageState extends State<_ResizedSpecialImage> {
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ExtendedImage.network(
        widget.url,
        width: width,
        height: height,
        fit: BoxFit.fitWidth,
        beforePaintImage:
            (Canvas canvas, Rect rect, ui.Image image, Paint paint) {
          const x = 0.0;
          const y = 0.0;
          const ratio = 0.75;
          final imgSourceWidth = image.width;
          final imgSourceHeight = image.height;
          final maxHeight = constraints.maxHeight;

          if (imgSourceHeight / imgSourceWidth > 3.0) {
            final l = x * imgSourceWidth;
            final w = imgSourceWidth + 0.0;
            final h = imgSourceWidth / ratio;
            final double t = y * (imgSourceHeight - h);
            canvas.drawImageRect(
                image,
                Rect.fromLTWH(l, t, w, h),
                Rect.fromLTWH(
                    rect.left, rect.top, maxHeight * ratio, maxHeight),
                paint);
            final newWidth = maxHeight * ratio;
            final newHeight = maxHeight;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (newWidth != width || newHeight != height) {
                setState(() {
                  width = newWidth;
                  height = newHeight;
                });
              }
            });
            return true;
          }
          return false;
        },
      );
    });
  }
}
