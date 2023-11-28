import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../repo/grpc/l10n.dart';
import '../../helper/spacing.dart';

class MyProfileCard extends StatelessWidget {
  const MyProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TipherethBloc, TipherethState>(
        builder: (context, state) {
      return Material(
        borderRadius: SpacingHelper.defaultBorderRadius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: SpacingHelper.defaultBorderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${state.currentUser?.id.id.toHexString()}'),
                    Text(state.currentUser?.username ?? '',
                        style: const TextStyle(
                          fontSize: 32,
                        )),
                    if (state.currentUser != null)
                      Text(userTypeString(state.currentUser!.type))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
