import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../helper/spacing.dart';

class YesodPreviewCard extends StatelessWidget {
  const YesodPreviewCard({
    super.key,
    required this.name,
    required this.title,
    required this.callback,
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      const imgPadding = 8;
      final double imgSize = constraints.biggest.width < 406
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (iconUrl != null && iconUrl!.isNotEmpty)
                          CachedNetworkImage(
                            imageUrl: iconUrl!,
                            height: 16,
                            width: 16,
                          ),
                        if (iconUrl != null && iconUrl!.isNotEmpty)
                          const SizedBox(
                            width: 8,
                          ),
                        SizedBox(
                          height: 18,
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
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (description != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        '${description!.length < 200 ? description! : description!.substring(0, 200)}...',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  if (images != null && images!.isNotEmpty)
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: images!.length == 1
                            ? imgSize * 2
                            : images!.length <= 3
                                ? imgSize
                                : images!.length <= 6
                                    ? imgSize * 2 + imgPadding
                                    : imgSize * 3 + imgPadding * 2,
                        maxWidth: imgSize * 3 + imgPadding * 2,
                      ),
                      child: ClipRRect(
                        borderRadius: SpacingHelper.defaultBorderRadius,
                        child: images!.length == 1
                            ? CachedNetworkImage(imageUrl: images![0])
                            : Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  for (final image in images!)
                                    Container(
                                      width: images!.length == 1
                                          ? imgSize * 3 + imgPadding * 2
                                          : images!.length == 2
                                              ? imgSize * 2
                                              : imgSize,
                                      height: images!.length <= 3
                                          ? imgSize * 3 + imgPadding * 2
                                          : imgSize,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              CachedNetworkImageProvider(image),
                                          fit: BoxFit.fitWidth,
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
        ),
      );
    });
  }
}
