import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waitress/view/page/gebura/gebura_library_list.dart';
import 'package:waitress/view/widget/rail_tile.dart';

class GeburaFramePage extends StatelessWidget {
  const GeburaFramePage(
      {super.key,
      required this.function,
      required this.functionPage,
      required this.selectedAppID});

  final String function;
  final Widget functionPage;
  final String selectedAppID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 256,
            child: Column(
              children: [
                SizedBox(
                  height: 64,
                  child: RailTile(
                    leading: Icon(
                      Icons.shopping_cart,
                    ),
                    onTap: () {
                      GoRouter.of(context).go("/app/Gebura/store");
                    },
                    title: const Text("Store"),
                    selected: function == "store",
                  ),
                ),
                Divider(
                  height: 10,
                  indent: 20,
                  endIndent: 20,
                  thickness: 2,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Theme.of(context).colorScheme.outline
                      : Theme.of(context).colorScheme.outlineVariant,
                ),
                Expanded(
                  child: GeburaLibraryListPage(selectedAppID: selectedAppID),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: functionPage,
            ),
          ),
        ],
      ),
    );
  }
}
