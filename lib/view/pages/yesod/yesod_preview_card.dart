import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
  static const basicHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: callback,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
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
                        height: 16,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 10,
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
                  Text(
                    '${description!}...',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                if (images != null && images!.isNotEmpty)
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 406,
                      maxWidth: 406,
                    ),
                    child: images!.length == 1
                        ? CachedNetworkImage(imageUrl: images![0])
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (final image in images!)
                                  Container(
                                    width: images!.length == 1
                                        ? 406
                                        : images!.length == 2
                                            ? 260
                                            : 130,
                                    height: images!.length <= 3 ? 406 : 130,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            CachedNetworkImageProvider(image),
                                        fit: BoxFit.cover,
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
  }
}
