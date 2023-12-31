import 'dart:ui' as ui;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../model/yesod_model.dart';
import '../../helper/spacing.dart';

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
  });

  final String? iconUrl;
  final String name;
  final List<String>? images;
  final String title;
  final String? description;
  final void Function() callback;
  final FeedListType listType;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      const maxTitleLines = 2;
      const maxDescriptionLines = 3;
      const cardPadding = 8.0;
      const imgPadding = 8;
      const iconSize = 18.0;
      final double leftImageSize = listType == FeedListType.magazine ? 128 : 0;
      final double bottomImageSize = constraints.biggest.width < 406
          ? (constraints.biggest.width - 4 * imgPadding) / 3
          : 130;
      return Material(
        borderRadius: SpacingHelper.defaultBorderRadius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: SpacingHelper.defaultBorderRadius,
            color: Theme.of(context).cardColor,
          ),
          child: InkWell(
            borderRadius: SpacingHelper.defaultBorderRadius,
            onTap: callback,
            child: Padding(
              padding: const EdgeInsets.all(cardPadding),
              child: Row(children: [
                if (listType == FeedListType.magazine)
                  Container(
                    width: leftImageSize,
                    padding: const EdgeInsets.only(right: cardPadding),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: leftImageSize,
                        maxWidth: leftImageSize,
                      ),
                      child: ClipRRect(
                        borderRadius: SpacingHelper.defaultBorderRadius,
                        child: images != null && images!.isNotEmpty
                            ? ExtendedImage.network(images![0])
                            : Container(),
                      ),
                    ),
                  ),
                Container(
                  width: constraints.biggest.width -
                      2 * cardPadding -
                      leftImageSize,
                  constraints: listType == FeedListType.magazine
                      ? BoxConstraints(
                          minHeight: leftImageSize,
                        )
                      : null,
                  child: ClipRect(
                    child: Flex(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: listType == FeedListType.table
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      direction: listType == FeedListType.table
                          ? Axis.horizontal
                          : Axis.vertical,
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
                        if (description != null)
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
                        if (listType == FeedListType.card &&
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
                                  ? _ResizedSpecialImage(images![0])
                                  : Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        for (final image in images!)
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
                                            child: _ResizedSpecialImage(image),
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
      double? newWidth;
      double? newHeight;
      final res = ExtendedImage.network(
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
            newWidth = maxHeight * ratio;
            newHeight = maxHeight;
            return true;
          }

          return false;
        },
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (newWidth != width || newHeight != height) {
          setState(() {
            width = newWidth;
            height = newHeight;
          });
        }
      });
      return res;
    });
  }
}
