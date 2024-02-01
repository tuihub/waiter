import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';
import '../../model/common_model.dart';
import '../../route.dart';
import '../layout/bootstrap_container.dart';
import '../specialized/nav_rail.dart';
import 'login_page.dart';

class ServerSelectOverlay extends StatefulWidget {
  const ServerSelectOverlay({super.key, required this.child});

  final Widget child;

  static ServerSelectOverlayState? of(BuildContext context) {
    return context.findAncestorStateOfType<ServerSelectOverlayState>();
  }

  @override
  State<ServerSelectOverlay> createState() => ServerSelectOverlayState();
}

class ServerSelectOverlayState extends State<ServerSelectOverlay>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    current = context.read<MainBloc>().state.serverConfig;
  }

  double height = 0;
  ServerConfig? current;
  ServerConfig? selected;
  double translate = 1;

  void fullscreen() {
    selected = current;
    _animateTo(0);
  }

  void minimize() {
    _animateTo(-height);
  }

  void hide() {
    _animateTo(-height);
  }

  void _animateTo(double goal) {
    final animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.dispose();
      }
    });

    final animation = Tween<double>(begin: translate, end: goal).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animation.addListener(() {
      setState(() {
        translate = animation.value;
      });
    });

    animationController.forward();
  }

  @override
  void didUpdateWidget(covariant ServerSelectOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    current = context.read<MainBloc>().state.serverConfig;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            if (state is MainAutoLoginState && state.success) {
              AppRoutes.tiphereth.go(context);
              minimize();
            }
            if (state is MainAutoLoginState && state.failed) {
              fullscreen();
            }
            if (state is MainManualLoginState && state.success) {
              AppRoutes.tiphereth.go(context);
              minimize();
            }
          },
          builder: (context, state) {
            return LayoutBuilder(builder: (context, constraints) {
              if (height != constraints.biggest.height) {
                height = constraints.biggest.height;
              }
              if (translate > 0) {
                translate = -height;
              }
              return Transform.translate(
                offset: Offset(0, translate),
                child: Scaffold(
                    body: Stack(children: [
                      NavRail(
                        leading: [
                          if (current != null)
                            IconMenuItem(
                              icon: Icons.account_circle,
                              selected: current?.id == selected?.id,
                              onPressed: () {
                                setState(() {
                                  selected = current;
                                });
                              },
                            ),
                        ],
                        body: [
                          for (final ServerConfig server
                              in state.knownServers ?? [])
                            if (server.id != current?.id)
                              IconMenuItem(
                                icon: Icons.account_circle,
                                selected: server.id == selected?.id,
                                onPressed: () {
                                  setState(() {
                                    selected = server;
                                  });
                                },
                              ),
                        ],
                        trailing: [
                          IconMenuItem(
                            icon: Icons.add,
                            selected: selected == null,
                            onPressed: () {
                              setState(() {
                                selected = null;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 64),
                        child: BootstrapContainer(
                          children: [
                            BootstrapColumn(
                              xxs: 12,
                              md: 8,
                              lg: 6,
                              child: selected != null
                                  ? ServerDetail(config: selected!)
                                  : const NewServer(),
                            )
                          ],
                        ),
                      )
                    ]),
                    floatingActionButton: FloatingActionButton.extended(
                      onPressed: hide,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Enter'),
                    )),
              );
            });
          },
        ),
      ],
    );
  }
}

class ServerDetail extends StatelessWidget {
  const ServerDetail({super.key, required this.config});

  final ServerConfig config;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(config.host),
        ],
      ),
    );
  }
}

class NewServer extends StatelessWidget {
  const NewServer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.serverConfig != null) {
          return const Card(child: SizedBox(height: 360, child: LoginWidget()));
        }
        return const Card(
            child: SizedBox(height: 450, child: ServerSelectWidget()));
      },
    );
  }
}
