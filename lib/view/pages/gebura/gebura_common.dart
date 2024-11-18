import 'package:extended_image/extended_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart' as io;

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../universal/universal.dart';

class GeburaAppCoverImage extends StatelessWidget {
  const GeburaAppCoverImage({
    this.url,
    this.path,
    super.key,
  });

  final String? url;
  final String? path;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        if (path != null) {
          return ExtendedImage.file(
            io.File(path!),
          );
        } else if (url != null) {
          return ExtendedImage.network(
            url!,
            height: 200,
            loadStateChanged: (ExtendedImageState state) {
              if (state.extendedImageLoadState == LoadState.failed) {
                return ExtendedImage.asset(
                  'assets/images/gebura_library_cover_placeholder.png',
                );
              }
              return null;
            },
          );
        } else {
          return ExtendedImage.asset(
            'assets/images/gebura_library_cover_placeholder.png',
          );
        }
      },
    );
  }
}

class GeburaAppIconImage extends StatelessWidget {
  const GeburaAppIconImage({
    this.url,
    this.path,
    super.key,
  });

  final String? url;
  final String? path;

  DecorationImage? _buildImage(BuildContext context) {
    if (path != null) {
      return DecorationImage(
        image: ExtendedFileImageProvider(io.File(path!)),
        fit: BoxFit.scaleDown,
      );
    } else if (url != null) {
      return DecorationImage(
        image: ExtendedNetworkImageProvider(url!),
        fit: BoxFit.scaleDown,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: _buildImage(context),
          ),
          height: 20,
          width: 20,
        );
      },
    );
  }
}

class GeburaAppBackgroundImage extends StatelessWidget {
  const GeburaAppBackgroundImage({
    this.url,
    this.path,
    super.key,
  });

  final String? url;
  final String? path;

  DecorationImage? _buildImage(BuildContext context) {
    if (path != null) {
      return DecorationImage(
        image: ExtendedFileImageProvider(io.File(path!)),
        fit: BoxFit.cover,
      );
    } else if (url != null) {
      return DecorationImage(
        image: ExtendedNetworkImageProvider(url!),
        fit: BoxFit.cover,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: UniversalUI.of(context).defaultBorderRadius,
            image: _buildImage(context),
          ),
          height: 400,
        );
      },
    );
  }
}
