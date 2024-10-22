import 'package:extended_image/extended_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart' as io;

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../common/steam/steam.dart';
import '../../../model/gebura_model.dart';
import '../../helper/url.dart';
import '../../universal/universal.dart';

String? _getSteamAppID(BuildContext context, LibraryListItem item) {
  final state = context.read<GeburaBloc>().state;
  if (item.localAppUUID != null && state.localTrackedAppInsts != null) {
    for (final inst in state.localTrackedAppInsts!.values) {
      if (inst.appUUID == item.localAppUUID &&
          inst.steamLaunchSetting != null) {
        return inst.steamLaunchSetting!.steamAppID;
      }
    }
  }
  return null;
}

class GeburaAppCoverImage extends StatelessWidget {
  const GeburaAppCoverImage({
    required this.item,
    super.key,
  });

  final LibraryListItem item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        final steamAppID = _getSteamAppID(context, item);
        if (steamAppID != null) {
          final path = getAppCoverFilePath(steamAppID);
          if (path != null) {
            return ExtendedImage.file(
              io.File(path),
            );
          }
        }
        final placeholder = ExtendedImage.asset(
          'assets/images/gebura_library_cover_placeholder.png',
        );
        if (!UrlHelper.isValidUrl(item.coverImageUrl)) {
          return placeholder;
        }
        return ExtendedImage.network(
          item.coverImageUrl,
          height: 200,
          loadStateChanged: (ExtendedImageState state) {
            if (state.extendedImageLoadState == LoadState.failed) {
              return placeholder;
            }
            return null;
          },
        );
      },
    );
  }
}

class GeburaAppIconImage extends StatelessWidget {
  const GeburaAppIconImage({
    required this.item,
    super.key,
  });

  final LibraryListItem item;

  ImageProvider _buildImageProvider(BuildContext context) {
    final steamAppID = _getSteamAppID(context, item);
    if (steamAppID != null) {
      final path = getAppIconFilePath(steamAppID);
      if (path != null) {
        return ExtendedFileImageProvider(io.File(path));
      }
    }
    return ExtendedNetworkImageProvider(item.iconImageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: _buildImageProvider(context),
              fit: BoxFit.scaleDown,
            ),
          ),
          height: 24,
          width: 24,
        );
      },
    );
  }
}

class GeburaAppBackgroundImage extends StatelessWidget {
  const GeburaAppBackgroundImage({
    required this.item,
    super.key,
  });

  final LibraryListItem item;

  ImageProvider _buildImageProvider(BuildContext context) {
    final steamAppID = _getSteamAppID(context, item);
    if (steamAppID != null) {
      final path = getAppBackgroundFilePath(steamAppID);
      if (path != null) {
        return ExtendedFileImageProvider(io.File(path));
      }
    }
    return ExtendedNetworkImageProvider(item.backgroundImageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: UniversalUI.of(context).defaultBorderRadius,
            image: DecorationImage(
              image: _buildImageProvider(context),
              fit: BoxFit.cover,
            ),
          ),
          height: 400,
        );
      },
    );
  }
}
