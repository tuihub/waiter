// class ServerSelectOverlay extends StatefulWidget {
//   const ServerSelectOverlay({super.key, required this.child});
//
//   final Widget child;
//
//   static ServerSelectOverlayState? of(BuildContext context) {
//     return context.findAncestorStateOfType<ServerSelectOverlayState>();
//   }
//
//   @override
//   State<ServerSelectOverlay> createState() => ServerSelectOverlayState();
// }
//
// class ServerSelectOverlayState extends State<ServerSelectOverlay>
//     with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     _current = context.read<MainBloc>().state.currentServer;
//   }
//
//   double _height = double.maxFinite;
//   ServerConfig? _current;
//   ServerConfig? _selected;
//   bool _preloginSettings = false;
//   double translate = 1;
//   bool _minimized = false;
//   bool _fullscreen = false;
//   static const minimizedHeight = 64.0;
//
//   void fullscreen() {
//     _minimized = false;
//     _fullscreen = true;
//     _animateTo(0);
//   }
//
//   void minimize() {
//     _minimized = true;
//     _fullscreen = false;
//     _animateTo(minimizedHeight - _height);
//     hide();
//   }
//
//   void hide() {
//     _minimized = false;
//     _fullscreen = false;
//     _animateTo(-_height);
//   }
//
//   void _animateTo(double goal, {void Function()? onComplete}) {
//     final animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 200));
//     final animation = Tween<double>(begin: translate, end: goal).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Curves.fastOutSlowIn,
//       ),
//     );
//
//     animation.addListener(() {
//       setState(() {
//         translate = animation.value;
//       });
//     });
//
//     unawaited(animationController.forward().then((value) {
//       animationController.dispose();
//       onComplete?.call();
//     }));
//   }
//
//   @override
//   void didUpdateWidget(covariant ServerSelectOverlay oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _current = context.read<MainBloc>().state.currentServer;
//     if (_minimized) {
//       minimize();
//     } else if (_fullscreen) {
//       fullscreen();
//     } else {
//       hide();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         widget.child,
//         BlocConsumer<MainBloc, MainState>(
//           listener: (context, state) {
//             if (state is MainAutoLoginState && state.success) {
//               _current = context.read<MainBloc>().state.currentServer;
//               _selected = _current;
//               const TipherethRootRoute().go(context);
//               minimize();
//             }
//             if (state is MainAutoLoginState && state.failed) {
//               if (state.msg != null) {
//                 Toast(
//                   title: '',
//                   message: S.of(context).loginFailed(state.msg ?? ''),
//                 ).show(context);
//               }
//               if (_selected != null) {
//                 context.read<MainBloc>().add(
//                       MainSetNextServerConfigEvent(_selected!),
//                     );
//               }
//             }
//             if (state is MainManualLoginState && state.success) {
//               const TipherethRootRoute().go(context);
//               minimize();
//             }
//             if (state is MainEnterLocalModeState && state.success) {
//               const TipherethRootRoute().go(context);
//               minimize();
//             }
//             if (state is MainNewServerSetState) {
//               setState(() {
//                 _current = null;
//               });
//               fullscreen();
//             }
//           },
//           builder: (context, state) {
//             final instanceSummary = (state.knownServerInstanceSummary ??
//                 {})[_selected?.id ?? state.nextServer?.id];
//             return LayoutBuilder(builder: (context, constraints) {
//               if (_height != constraints.biggest.height) {
//                 _height = constraints.biggest.height;
//                 if (translate < 0) {
//                   translate = -_height;
//                 }
//               }
//               if (translate > 0) {
//                 translate = -_height;
//               }
//               return Transform.translate(
//                 offset: Offset(0, translate),
//                 child: Scaffold(
//                   body: Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: ExtendedNetworkImageProvider(
//                             instanceSummary?.backgroundUrl ?? ''),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Stack(children: [
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         constraints: const BoxConstraints.expand(width: 64),
//                         child: const ClipRect(
//                           child: BackdropBlur(
//                             begin: Alignment.center,
//                             end: Alignment.center,
//                           ),
//                         ),
//                       ),
//                       if (_minimized)
//                         Container(
//                           margin: EdgeInsets.only(top: _height - 64),
//                           alignment: Alignment.bottomCenter,
//                           constraints: const BoxConstraints.expand(height: 64),
//                           child: const ClipRect(
//                             child: BackdropBlur(
//                               begin: Alignment.center,
//                               end: Alignment.center,
//                             ),
//                           ),
//                         )
//                       else
//                         const SizedBox(),
//                       if (_minimized)
//                         Container(
//                           alignment: Alignment.bottomCenter,
//                           child: Container(
//                             height: 64,
//                             alignment: Alignment.center,
//                             child: Text(
//                               _current?.host ?? '',
//                               style:
//                                   backdropBlurTextStyle(context, fontSize: 24),
//                             ),
//                           ),
//                         )
//                       else
//                         const SizedBox(),
//                       NavRail(
//                         leading: [
//                           if (_current != null)
//                             if (ConnectionHelper.isLocal(context))
//                               IconMenuItem(
//                                 icon: Icons.signal_wifi_connected_no_internet_4,
//                                 selected: false,
//                                 onPressed: () {
//                                   setState(() {
//                                     _preloginSettings = false;
//                                     _selected = _current;
//                                   });
//                                 },
//                               )
//                             else
//                               AvatarMenuItem(
//                                 name: _current!.host,
//                                 image: state
//                                         .knownServerInstanceSummary?[
//                                             _current?.id ?? '']
//                                         ?.logoUrl ??
//                                     '',
//                                 selected: _current?.id == _selected?.id,
//                                 onPressed: () {
//                                   setState(() {
//                                     _preloginSettings = false;
//                                     _selected = _current;
//                                   });
//                                 },
//                               ),
//                         ],
//                         body: [
//                           for (final ServerConfig server
//                               in state.knownServers ?? [])
//                             if (server.id != _current?.id)
//                               AvatarMenuItem(
//                                 name: server.host,
//                                 image: state
//                                         .knownServerInstanceSummary?[server.id]
//                                         ?.logoUrl ??
//                                     '',
//                                 selected: server.id == _selected?.id,
//                                 onPressed: () {
//                                   setState(() {
//                                     _preloginSettings = false;
//                                     _selected = server;
//                                   });
//                                 },
//                               ),
//                         ],
//                         trailing: [
//                           if (_minimized)
//                             if (ConnectionHelper.isLocal(context))
//                               IconMenuItem(
//                                 icon: Icons.signal_wifi_connected_no_internet_4,
//                                 selected: false,
//                                 onPressed: () {
//                                   ServerSelectOverlay.of(context)?.fullscreen();
//                                 },
//                               )
//                             else
//                               AvatarMenuItem(
//                                 name: _current?.host ?? '',
//                                 image: state
//                                         .knownServerInstanceSummary?[
//                                             _current?.id ?? '']
//                                         ?.logoUrl ??
//                                     '',
//                                 selected: false,
//                                 onPressed: () {
//                                   ServerSelectOverlay.of(context)?.fullscreen();
//                                 },
//                               )
//                           else
//                             IconMenuItem(
//                               icon: Icons.add,
//                               selected: !_preloginSettings && _selected == null,
//                               onPressed: () {
//                                 setState(() {
//                                   _preloginSettings = false;
//                                   _selected = null;
//                                 });
//                               },
//                             ),
//                           if (ConnectionHelper.isNotLocal(context))
//                             IconMenuItem(
//                               icon: Icons.signal_wifi_connected_no_internet_4,
//                               selected: false,
//                               onPressed: () {
//                                 unawaited(showDialog<void>(
//                                   context: context,
//                                   builder: (context) {
//                                     return UniversalDialog(
//                                       title: const Text('进入本地模式'),
//                                       content: const Text('是否进入本地模式？'),
//                                       actions: [
//                                         UniversalDialogAction(
//                                           onPressed: () {
//                                             context
//                                                 .read<MainBloc>()
//                                                 .add(MainEnterLocalModeEvent());
//                                             Navigator.of(context).pop();
//                                           },
//                                           isPrimary: true,
//                                           child: const Text('是'),
//                                         ),
//                                         UniversalDialogAction(
//                                           onPressed: () {
//                                             Navigator.of(context).pop();
//                                           },
//                                           child: const Text('否'),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 ));
//                               },
//                             ),
//                           if (_current == null)
//                             IconMenuItem(
//                               icon: Icons.settings,
//                               selected: _preloginSettings,
//                               onPressed: () {
//                                 setState(() {
//                                   _preloginSettings = true;
//                                 });
//                               },
//                             ),
//                         ],
//                       ),
//                       Container(
//                         padding: const EdgeInsets.only(left: 64),
//                         child: BootstrapContainer(
//                           children: [
//                             BootstrapColumn(
//                               xxs: 11,
//                               md: 8,
//                               lg: 6,
//                               child: _preloginSettings
//                                   ? const ClientSettingPage()
//                                   : DynMouseScroll(
//                                       builder: (context, controller, physics) {
//                                       return SingleChildScrollView(
//                                         controller: controller,
//                                         physics: physics,
//                                         child: _selected != null
//                                             ? ServerDetail(config: _selected!)
//                                             : const NewServer(),
//                                       );
//                                     }),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ]),
//                   ),
//                   floatingActionButton: _selected != null && !_minimized
//                       ? FloatingActionButton.extended(
//                           onPressed: (state is MainAutoLoginState &&
//                                   state.processing)
//                               ? null
//                               : () {
//                                   if (_selected!.id ==
//                                       state.currentServer?.id) {
//                                     ServerSelectOverlay.of(context)?.minimize();
//                                   } else {
//                                     context.read<MainBloc>().add(
//                                           MainAutoLoginEvent(config: _selected),
//                                         );
//                                   }
//                                 },
//                           icon: const Icon(Icons.login),
//                           label: Text(_selected!.id == state.currentServer?.id
//                               ? S.of(context).continueInCurrentServer
//                               : S.of(context).login),
//                         )
//                       : null,
//                 ),
//               );
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class ServerDetail extends StatelessWidget {
//   const ServerDetail({super.key, required this.config});
//
//   final ServerConfig config;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
//       final instanceSummary =
//           (state.knownServerInstanceSummary ?? {})[config.id];
//       return Column(
//         children: [
//           if (instanceSummary != null && instanceSummary.logoUrl.isNotEmpty)
//             Container(
//               height: 128,
//               width: 128,
//               margin: const EdgeInsets.all(16),
//               child: ExtendedImage.network(
//                 instanceSummary.logoUrl,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           UniversalCard(
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     (instanceSummary?.name.isNotEmpty ?? false)
//                         ? instanceSummary!.name
//                         : config.id,
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   if (instanceSummary?.description.isNotEmpty ?? false)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 4),
//                       child: Text(instanceSummary!.description,
//                           style: Theme.of(context).textTheme.bodyMedium),
//                     ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       );
//     });
//   }
// }
//
