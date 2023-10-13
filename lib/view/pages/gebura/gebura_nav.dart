import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/rail_tile.dart';
import '../../helper/spacing.dart';
import '../../layout/overlapping_panels.dart';
import 'gebura_library_list.dart';

class GeburaNav extends StatelessWidget {
  const GeburaNav(
      {super.key, required this.function, required this.selectedAppID});

  final String function;
  final String selectedAppID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceTint.withAlpha(24),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            RailTile(
              leading: const Icon(
                Icons.shopping_cart,
              ),
              onTap: () {
                GoRouter.of(context).go('/app/Gebura/store');
                OverlappingPanels.of(context)?.reveal(RevealSide.main);
              },
              title: const Text('Store'),
              selected: function == 'store',
            ),
            SpacingHelper.defaultDivider,
            Expanded(
              child: GeburaLibraryListPage(selectedAppID: selectedAppID),
            )
          ],
        ),
      ),
    );
  }
}
