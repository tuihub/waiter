import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waitress/bloc/user_login/user_bloc.dart';
import 'package:waitress/view/widgets/title_bar.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: BlocConsumer<UserBloc, UserLoginState>(
        listener: (context, state) {
          if (state is UserLoggedIn) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "欢迎回来",
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AppInitialize) {
            context.read<UserBloc>().add(LoadLocalSettingEvent());
          }
          return Scaffold(
            body: Column(children: [
              const TitleBar(),
              Expanded(
                child: Scaffold(
                  body: Center(
                    child: Card(
                      child: SizedBox(
                        width: 540,
                        height: 320,
                        child: getInitWidget(state),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            floatingActionButton: state is! AutoLogging
                ? FloatingActionButton.extended(
                    onPressed: () {
                      context.read<UserBloc>().add(ManualLoginEvent());
                      GoRouter.of(context).go(
                        '/login',
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text("登录"),
                  )
                : Container(),
          );
        },
      ),
    );
  }

  Widget getInitWidget(UserLoginState state) {
    if (state is AutoLogging) {
      return const InitWidget();
    }
    return const WelComeWidget();
  }
}

class InitWidget extends StatelessWidget {
  const InitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tui",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 145, 0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "Hub",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      ],
    );
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
