import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class YesodPreviewCard extends StatelessWidget {
  const YesodPreviewCard({
    super.key,
    required this.iconUrl,
    required this.name,
    required this.title,
    required this.callback,
    this.image,
    this.description,
  });

  final String iconUrl;
  final String name;
  final String? image;
  final String title;
  final String? description;
  final void Function() callback;

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
              children: [
                SizedBox(
                  height: 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: iconUrl,
                        height: 16,
                        width: 16,
                      ),
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
                Expanded(
                  child: Row(
                    children: [
                      if (image != null && image!.isNotEmpty)
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(image!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      if (image != null && image!.isNotEmpty)
                        const SizedBox(
                          width: 16,
                        ),
                      Expanded(
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            if (description != null)
                              Text(
                                description!,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
