import 'dart:async';
import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart' hide Image;

typedef DoubleClickAnimationListener = void Function();

class PicSwiperItem {
  PicSwiperItem({
    required this.picUrl,
    this.des = '',
  });
  final String picUrl;
  final String? des;
}

/// make hero better when slide out
class HeroWidget extends StatefulWidget {
  const HeroWidget({
    super.key,
    required this.child,
    required this.tag,
    required this.slidePagekey,
    this.slideType = SlideType.onlyImage,
  });
  final Widget child;
  final SlideType slideType;
  final Object tag;
  final GlobalKey<ExtendedImageSlidePageState> slidePagekey;
  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> {
  RectTween? _rectTween;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.tag,
      createRectTween: (Rect? begin, Rect? end) {
        _rectTween = RectTween(begin: begin, end: end);
        return _rectTween!;
      },
      // make hero better when slide out
      flightShuttleBuilder: (BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext) {
        // make hero more smoothly
        final Hero hero = (flightDirection == HeroFlightDirection.pop
            ? fromHeroContext.widget
            : toHeroContext.widget) as Hero;
        if (_rectTween == null) {
          return hero;
        }

        if (flightDirection == HeroFlightDirection.pop) {
          final bool fixTransform = widget.slideType == SlideType.onlyImage &&
              (widget.slidePagekey.currentState!.offset != Offset.zero ||
                  widget.slidePagekey.currentState!.scale != 1.0);

          final Widget toHeroWidget = (toHeroContext.widget as Hero).child;
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext buildContext, Widget? child) {
              Widget animatedBuilderChild = hero.child;

              // make hero more smoothly
              animatedBuilderChild = Stack(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                children: <Widget>[
                  Opacity(
                    opacity: 1 - animation.value,
                    child: UnconstrainedBox(
                      child: SizedBox(
                        width: _rectTween!.begin!.width,
                        height: _rectTween!.begin!.height,
                        child: toHeroWidget,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: animation.value,
                    child: animatedBuilderChild,
                  )
                ],
              );

              // fix transform when slide out
              if (fixTransform) {
                final Tween<Offset> offsetTween = Tween<Offset>(
                    begin: Offset.zero,
                    end: widget.slidePagekey.currentState!.offset);

                final Tween<double> scaleTween = Tween<double>(
                    begin: 1.0, end: widget.slidePagekey.currentState!.scale);
                animatedBuilderChild = Transform.translate(
                  offset: offsetTween.evaluate(animation),
                  child: Transform.scale(
                    scale: scaleTween.evaluate(animation),
                    child: animatedBuilderChild,
                  ),
                );
              }

              return animatedBuilderChild;
            },
          );
        }
        return hero.child;
      },
      child: widget.child,
    );
  }
}

class ImageDetail extends StatelessWidget {
  const ImageDetail(this.index, {super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(
            color: Colors.grey,
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Colors.grey, blurRadius: 15.0, spreadRadius: 20.0),
          ]),
      child: const Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageDetailInfo {
  ImageDetailInfo({
    required this.imageDRect,
    required this.pageSize,
    required this.imageInfo,
  });
  final GlobalKey<State<StatefulWidget>> key = GlobalKey<State>();

  final Rect imageDRect;

  final Size pageSize;

  final ImageInfo imageInfo;

  double? _maxImageDetailY;
  double get imageBottom => imageDRect.bottom - 20;
  double get maxImageDetailY {
    try {
      //
      return _maxImageDetailY ??= max(
          key.currentContext!.size!.height - (pageSize.height - imageBottom),
          0.1);
    } catch (e) {
      //currentContext is not ready
      return 100.0;
    }
  }
}

class MySwiperPlugin extends StatelessWidget {
  const MySwiperPlugin(this.pics, this.index, this.reBuild, {super.key});
  final List<PicSwiperItem>? pics;
  final int? index;
  final StreamController<int> reBuild;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      builder: (BuildContext context, AsyncSnapshot<int> data) {
        return DefaultTextStyle(
          style: const TextStyle(color: Colors.blue),
          child: Container(
            height: 50.0,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.2),
            child: Row(
              children: <Widget>[
                Container(
                  width: 10.0,
                ),
                Text(
                  '${data.data! + 1}',
                ),
                Text(
                  ' / ${pics!.length}',
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Text(pics![data.data!].des ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.blue))),
                const SizedBox(
                  width: 10.0,
                ),
                // TODO: implement.
                // if (!kIsWeb)
                //   GestureDetector(
                //     child: Container(
                //       padding: const EdgeInsets.only(right: 10.0),
                //       alignment: Alignment.center,
                //       child: const Text(
                //         'Save',
                //         style: TextStyle(fontSize: 16.0, color: Colors.blue),
                //       ),
                //     ),
                //     onTap: () {
                //       saveNetworkImageToPhoto(pics![index!].picUrl)
                //           .then((bool done) {
                //         showToast(done ? 'save succeed' : 'save failed',
                //             position: const ToastPosition(
                //                 align: Alignment.topCenter));
                //       });
                //     },
                //   ),
              ],
            ),
          ),
        );
      },
      initialData: index,
      stream: reBuild.stream,
    );
  }
}

class PicSwiper extends StatefulWidget {
  const PicSwiper({
    super.key,
    this.index,
    this.pics,
  });
  final int? index;
  final List<PicSwiperItem>? pics;
  @override
  State<PicSwiper> createState() => _PicSwiperState();
}

class _PicSwiperState extends State<PicSwiper> with TickerProviderStateMixin {
  final StreamController<int> rebuildIndex = StreamController<int>.broadcast();
  final StreamController<bool> rebuildSwiper =
      StreamController<bool>.broadcast();
  final StreamController<double> rebuildDetail =
      StreamController<double>.broadcast();
  final Map<int, ImageDetailInfo> detailKeys = <int, ImageDetailInfo>{};
  late AnimationController _doubleClickAnimationController;
  late AnimationController _slideEndAnimationController;
  late Animation<double> _slideEndAnimation;
  Animation<double>? _doubleClickAnimation;
  late DoubleClickAnimationListener _doubleClickAnimationListener;
  List<double> doubleTapScales = <double>[1.0, 2.0];
  GlobalKey<ExtendedImageSlidePageState> slidePagekey =
      GlobalKey<ExtendedImageSlidePageState>();
  int? _currentIndex = 0;
  bool _showSwiper = true;
  double _imageDetailY = 0;
  Rect? imageDRect;

  final List<int> _cachedIndexes = <int>[];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadImage(widget.index! - 1);
    _preloadImage(widget.index! + 1);
  }

  Future<void> _preloadImage(int index) async {
    if (_cachedIndexes.contains(index)) {
      return;
    }
    if (0 <= index && index < widget.pics!.length) {
      final String url = widget.pics![index].picUrl;

      await precacheImage(
        ExtendedNetworkImageProvider(
          url,
          cache: true,
        ),
        context,
      );

      _cachedIndexes.add(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    imageDRect = Offset.zero & size;
    final Widget result = Material(

        /// if you use ExtendedImageSlidePage and slideType =SlideType.onlyImage,
        /// make sure your page is transparent background
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ExtendedImageGesturePageView.builder(
              controller: ExtendedPageController(
                initialPage: widget.index!,
                pageSpacing: 50,
                shouldIgnorePointerWhenScrolling: false,
              ),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              canScrollPage: (GestureDetails? gestureDetails) {
                return _imageDetailY >= 0;
                //return (gestureDetails?.totalScale ?? 1.0) <= 1.0;
              },
              itemBuilder: (BuildContext context, int index) {
                final String item = widget.pics![index].picUrl;

                Widget image = ExtendedImage.network(
                  item,
                  fit: BoxFit.contain,
                  enableSlideOutPage: true,
                  mode: ExtendedImageMode.gesture,
                  //layoutInsets: EdgeInsets.all(20),
                  initGestureConfigHandler: (ExtendedImageState state) {
                    double? initialScale = 1.0;

                    if (state.extendedImageInfo != null) {
                      initialScale = initScale(
                          size: size,
                          initialScale: initialScale,
                          imageSize: Size(
                              state.extendedImageInfo!.image.width.toDouble(),
                              state.extendedImageInfo!.image.height
                                  .toDouble()));
                    }
                    return GestureConfig(
                      inPageView: true,
                      initialScale: initialScale!,
                      maxScale: max(initialScale, 5.0),
                      animationMaxScale: max(initialScale, 5.0),
                      initialAlignment: InitialAlignment.center,
                      //you can cache gesture state even though page view page change.
                      //remember call clearGestureDetailsCache() method at the right time.(for example,this page dispose)
                      cacheGesture: false,
                    );
                  },
                  onDoubleTap: (ExtendedImageGestureState state) {
                    ///you can use define pointerDownPosition as you can,
                    ///default value is double tap pointer down postion.
                    final Offset? pointerDownPosition =
                        state.pointerDownPosition;
                    final double? begin = state.gestureDetails!.totalScale;
                    double end;

                    //remove old
                    _doubleClickAnimation
                        ?.removeListener(_doubleClickAnimationListener);

                    //stop pre
                    _doubleClickAnimationController.stop();

                    //reset to use
                    _doubleClickAnimationController.reset();

                    if (begin == doubleTapScales[0]) {
                      end = doubleTapScales[1];
                    } else {
                      end = doubleTapScales[0];
                    }

                    _doubleClickAnimationListener = () {
                      //print(_animation.value);
                      state.handleDoubleTap(
                          scale: _doubleClickAnimation!.value,
                          doubleTapPosition: pointerDownPosition);
                    };
                    _doubleClickAnimation = _doubleClickAnimationController
                        .drive(Tween<double>(begin: begin, end: end));

                    _doubleClickAnimation!
                        .addListener(_doubleClickAnimationListener);

                    _doubleClickAnimationController.forward();
                  },
                  loadStateChanged: (ExtendedImageState state) {
                    if (state.extendedImageLoadState == LoadState.completed) {
                      final Rect imageDRect = getDestinationRect(
                        rect: Offset.zero & size,
                        inputSize: Size(
                          state.extendedImageInfo!.image.width.toDouble(),
                          state.extendedImageInfo!.image.height.toDouble(),
                        ),
                        fit: BoxFit.contain,
                      );

                      // detailKeys[index] ??= ImageDetailInfo(
                      //   imageDRect: imageDRect,
                      //   pageSize: size,
                      //   imageInfo: state.extendedImageInfo!,
                      // );
                      // final ImageDetailInfo? imageDetailInfo =
                      //     detailKeys[index];
                      // return StreamBuilder<double>(
                      //   builder:
                      //       (BuildContext context, AsyncSnapshot<double> data) {
                      //     return ExtendedImageGesture(
                      //       state,
                      //       canScaleImage: (_) => _imageDetailY == 0,
                      //       imageBuilder: (Widget image) {
                      //         return Stack(
                      //           children: <Widget>[
                      //             Positioned.fill(
                      //               top: _imageDetailY,
                      //               bottom: -_imageDetailY,
                      //               child: image,
                      //             ),
                      //             Positioned(
                      //               left: 0.0,
                      //               right: 0.0,
                      //               top: imageDetailInfo!.imageBottom +
                      //                   _imageDetailY,
                      //               child: Opacity(
                      //                 opacity: _imageDetailY == 0
                      //                     ? 0
                      //                     : min(
                      //                         1,
                      //                         _imageDetailY.abs() /
                      //                             (imageDetailInfo
                      //                                     .maxImageDetailY /
                      //                                 4.0),
                      //                       ),
                      //                 child: ImageDetail(
                      //                   index,
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         );
                      //       },
                      //     );
                      //   },
                      //   initialData: _imageDetailY,
                      //   stream: rebuildDetail.stream,
                      // );
                    }
                    return null;
                  },
                );

                if (index < min(9, widget.pics!.length)) {
                  image = HeroWidget(
                    tag: item,
                    slideType: SlideType.onlyImage,
                    slidePagekey: slidePagekey,
                    child: image,
                  );
                }

                image = GestureDetector(
                  child: image,
                  onTap: () {
                    if (_imageDetailY != 0) {
                      _imageDetailY = 0;
                      rebuildDetail.sink.add(_imageDetailY);
                    } else {
                      slidePagekey.currentState!.popPage();
                      Navigator.pop(context);
                    }
                  },
                );

                return image;
              },
              itemCount: widget.pics!.length,
              onPageChanged: (int index) {
                _currentIndex = index;
                rebuildIndex.add(index);
                if (_imageDetailY != 0) {
                  _imageDetailY = 0;
                  rebuildDetail.sink.add(_imageDetailY);
                }
                _showSwiper = true;
                rebuildSwiper.add(_showSwiper);
                _preloadImage(index - 1);
                _preloadImage(index + 1);
              },
            ),
            StreamBuilder<bool>(
              builder: (BuildContext c, AsyncSnapshot<bool> d) {
                if (d.data == null || !d.data!) {
                  return Container();
                }

                return Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child:
                      MySwiperPlugin(widget.pics, _currentIndex, rebuildIndex),
                );
              },
              initialData: true,
              stream: rebuildSwiper.stream,
            )
          ],
        ));

    return ExtendedImageSlidePage(
      key: slidePagekey,
      slideAxis: SlideAxis.vertical,
      slideType: SlideType.onlyImage,
      slidePageBackgroundHandler: (Offset offset, Size pageSize) {
        final Color color = Theme.of(context).dialogBackgroundColor;
        const pageGestureAxis = SlideAxis.both;
        double opacity = 0.0;
        const opacityRatio = 0.8;
        if (pageGestureAxis == SlideAxis.both) {
          opacity = offset.distance /
              (Offset(pageSize.width, pageSize.height).distance / 2.0);
        } else if (pageGestureAxis == SlideAxis.horizontal) {
          opacity = offset.dx.abs() / (pageSize.width / 2.0);
        } else if (pageGestureAxis == SlideAxis.vertical) {
          opacity = offset.dy.abs() / (pageSize.height / 2.0);
        }
        return color.withOpacity(
            min(1.0 * opacityRatio, max((1.0 - opacity) * opacityRatio, 0.0)));
      },
      slideScaleHandler: (
        Offset offset, {
        ExtendedImageSlidePageState? state,
      }) {
        //image is ready and it's not sliding.
        if (state != null &&
            detailKeys[_currentIndex!] != null &&
            state.scale == 1.0) {
          //don't slide page if scale of image is more than 1.0
          if (state.imageGestureState!.gestureDetails!.totalScale! > 1.0) {
            return 1.0;
          }
          //or slide down into detail mode
          if (offset.dy < 0 || _imageDetailY < 0) {
            return 1.0;
          }
        }

        return null;
      },
      slideOffsetHandler: (
        Offset offset, {
        ExtendedImageSlidePageState? state,
      }) {
        //image is ready and it's not sliding.
        if (state != null &&
            detailKeys[_currentIndex!] != null &&
            state.scale == 1.0) {
          //don't slide page if scale of image is more than 1.0

          if (state.imageGestureState!.gestureDetails!.totalScale! > 1.0) {
            return Offset.zero;
          }

          //or slide down into detail mode
          if (offset.dy < 0 || _imageDetailY < 0) {
            _imageDetailY += offset.dy;

            // print(offset.dy);
            _imageDetailY = max(
                -detailKeys[_currentIndex!]!.maxImageDetailY, _imageDetailY);
            rebuildDetail.sink.add(_imageDetailY);
            return Offset.zero;
          }

          if (_imageDetailY != 0) {
            _imageDetailY = 0;
            _showSwiper = true;
            rebuildSwiper.add(_showSwiper);
            rebuildDetail.sink.add(_imageDetailY);
          }
        }
        return null;
      },
      slideEndHandler: (
        Offset offset, {
        ExtendedImageSlidePageState? state,
        ScaleEndDetails? details,
      }) {
        if (_imageDetailY != 0 && state!.scale == 1) {
          if (!_slideEndAnimationController.isAnimating) {
// get magnitude from gesture velocity
            final double magnitude = details!.velocity.pixelsPerSecond.distance;

            // do a significant magnitude

            if (magnitude.greaterThanOrEqualTo(minMagnitude)) {
              final Offset direction =
                  details.velocity.pixelsPerSecond / magnitude * 1000;

              _slideEndAnimation =
                  _slideEndAnimationController.drive(Tween<double>(
                begin: _imageDetailY,
                end: (_imageDetailY + direction.dy)
                    .clamp(-detailKeys[_currentIndex!]!.maxImageDetailY, 0.0),
              ));
              _slideEndAnimationController.reset();
              _slideEndAnimationController.forward();
            }
          }
          return false;
        }

        return null;
      },
      onSlidingPage: (ExtendedImageSlidePageState state) {
        ///you can change other widgets' state on page as you want
        ///base on offset/isSliding etc
        //var offset= state.offset;
        final bool showSwiper = !state.isSliding;
        if (showSwiper != _showSwiper) {
          // do not setState directly here, the image state will change,
          // you should only notify the widgets which are needed to change
          // setState(() {
          // _showSwiper = showSwiper;
          // });

          _showSwiper = showSwiper;
          rebuildSwiper.add(_showSwiper);
        }
      },
      child: result,
    );
  }

  double? initScale({
    required Size imageSize,
    required Size size,
    double? initialScale,
  }) {
    final double n1 = imageSize.height / imageSize.width;
    final double n2 = size.height / size.width;
    if (n1 > n2) {
      final FittedSizes fittedSizes =
          applyBoxFit(BoxFit.contain, imageSize, size);
      final Size destinationSize = fittedSizes.destination;
      return size.height / destinationSize.height;
    } else if (n1 / n2 < 1 / 4) {
      final FittedSizes fittedSizes =
          applyBoxFit(BoxFit.contain, imageSize, size);
      final Size destinationSize = fittedSizes.destination;
      return size.width / destinationSize.width;
    }

    return initialScale;
  }

  @override
  void dispose() {
    rebuildIndex.close();
    rebuildSwiper.close();
    rebuildDetail.close();
    _doubleClickAnimationController.dispose();
    _slideEndAnimationController.dispose();
    clearGestureDetailsCache();
    //cancelToken?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
    _doubleClickAnimationController = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);

    _slideEndAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _slideEndAnimationController.addListener(() {
      _imageDetailY = _slideEndAnimation.value;
      if (_imageDetailY == 0) {
        _showSwiper = true;
        rebuildSwiper.add(_showSwiper);
      }
      rebuildDetail.sink.add(_imageDetailY);
    });
  }
}
