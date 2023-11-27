import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../route.dart';
import '../components/toast.dart';
import '../layout/bootstrap_container.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: BlocConsumer<TipherethBloc, TipherethState>(
        listener: (context, state) {
          if (state is TipherethAutoLoginState && state.success) {
            AppRoutes.tiphereth.go(context);
            const Toast(title: '', message: '欢迎回来').show(context);
          }
        },
        builder: (context, state) {
          if (firstBuild) {
            firstBuild = false;
            context.read<TipherethBloc>().add(TipherethAutoLoginEvent());
          }
          return Scaffold(
            body: BootstrapContainer(children: [
              BootstrapColumn(
                xxs: 12,
                md: 6,
                child: Card(
                  child: SizedBox(
                    height: 320,
                    child: getInitWidget(state),
                  ),
                ),
              ),
            ]),
            floatingActionButton:
                state is TipherethAutoLoginState && state.failed
                    ? FloatingActionButton.extended(
                        onPressed: () {
                          AppRoutes.login.go(context);
                        },
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('登录'),
                      )
                    : Container(),
          );
        },
      ),
    );
  }

  Widget getInitWidget(TipherethState state) {
    return const InitWidget();
    // if (state is AutoLogging) {
    //   return const InitWidget();
    // }
    // return const WelComeWidget();
  }
}

class InitWidget extends StatelessWidget {
  const InitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TipherethBloc, TipherethState>(
        builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tui',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(
                width: 4,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Hub',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          if (state is TipherethAutoLoginState && state.processing)
            const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          else
            const SizedBox(
              height: 24,
              child: Text(
                'CLICK LOGIN TO START',
                style: TextStyle(fontSize: 16),
              ),
            ),
        ],
      );
    });
  }
}

class WelComeWidget extends StatelessWidget {
  const WelComeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          ' #',
          style: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(milliseconds: 3000),
            animatedTexts: [
              TyperAnimatedText(
                'Tiphereth',
                speed: const Duration(
                  milliseconds: 200,
                ),
                curve: Curves.easeOut,
              ),
              TyperAnimatedText(
                'Gebura',
                speed: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              ),
              TyperAnimatedText(
                'Yesod',
                speed: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
