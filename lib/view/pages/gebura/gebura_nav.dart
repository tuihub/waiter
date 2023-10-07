import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/rail_tile.dart';
import '../../helper/spacing.dart';
import 'gebura_library_list.dart';

class GeburaNav extends StatelessWidget {
  const GeburaNav(
      {super.key, required this.function, required this.selectedAppID});

  final String function;
  final String selectedAppID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 64,
            child: RailTile(
              leading: const Icon(
                Icons.shopping_cart,
              ),
              onTap: () {
                GoRouter.of(context).go('/app/Gebura/store');
              },
              title: const Text('Store'),
              selected: function == 'store',
            ),
          ),
          SpacingHelper.defaultDivider,
          Expanded(
            child: GeburaLibraryListPage(selectedAppID: selectedAppID),
          )
        ],
      ),
    );
  }
}
