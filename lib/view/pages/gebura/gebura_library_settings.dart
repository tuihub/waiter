import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../route.dart';

class GeburaLibrarySettings extends StatelessWidget {
  const GeburaLibrarySettings({super.key});

  @override
  Widget build(BuildContext context) {
    bool firstBuild = true;
    return BlocBuilder<GeburaBloc, GeburaState>(
      builder: (context, state) {
        if (firstBuild) {
          firstBuild = false;
        }
        final localLibraryState = state.localLibraryState ?? '';
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.zero,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(const FaIcon(FontAwesomeIcons.steam).icon),
                          const SizedBox(width: 16),
                          const Text('Steam'),
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AppRoutes.geburaLibrary.go(context);
            },
            child: const Icon(Icons.apps),
          ),
          floatingActionButtonLocation: localLibraryState.isNotEmpty
              ? FloatingActionButtonLocation.endContained
              : FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            child: BottomAppBar(
              height: localLibraryState.isNotEmpty ? 88 : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    localLibraryState,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 64),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
