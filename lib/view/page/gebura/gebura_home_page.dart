import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';
import 'package:waitress/view/page/gebura/gebura_library_list.dart';
import 'package:waitress/view/widget/rail_tile.dart';

class GeburaHome extends StatelessWidget {
  const GeburaHome(
      {super.key, required this.function, required this.functionPage});

  final String function;
  final Widget functionPage;

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
                      Icons.add,
                    ),
                    onTap: () {
                      GoRouter.of(context).go("/app/Gebura/store");
                    },
                    title: const Text("Add"),
                    selected: function == "add",
                  ),
                ),
                GeburaLibraryListPage()
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
    // return BlocConsumer<ApiRequestBloc, ApiRequestState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    //   },
    //   builder: (context, state) {
    //     if (state is! GeburaState) {
    //       context
    //           .read<ApiRequestBloc>()
    //           .add(GeburaLoadEvent(ListAppsRequest()));
    //     }
    //     return Scaffold(
    //       body: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Ink(
    //             padding: EdgeInsets.symmetric(horizontal: 8),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(8),
    //               color: Theme.of(context).colorScheme.secondaryContainer,
    //             ),
    //             child: RichText(
    //               text: TextSpan(
    //                 children: [
    //                   TextSpan(
    //                     text: "# ",
    //                     style: TextStyle(
    //                       color: Theme.of(context).colorScheme.primary,
    //                       fontSize: 28,
    //                     ),
    //                   ),
    //                   TextSpan(
    //                     text: "GEBURA ",
    //                     style: TextStyle(
    //                       fontSize: 28,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 8,
    //           ),
    //           Expanded(
    //             child: Card(
    //               margin: EdgeInsets.zero,
    //               child: GridView.builder(
    //                 padding: EdgeInsets.all(8),
    //                 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //                     maxCrossAxisExtent: 144),
    //                 itemBuilder: (BuildContext context, int index) {
    //                   if (state is GeburaLoadDone) {
    //                     if (index == state.resp.apps.length) {
    //                       return Ink(
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(8),
    //                           color: Theme.of(context)
    //                               .colorScheme
    //                               .secondaryContainer,
    //                         ),
    //                         child: Center(
    //                           child: Text("没有了"),
    //                         ),
    //                       );
    //                     }
    //                     final item = state.resp.apps.elementAt(index);
    //                     return Ink(
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(8),
    //                         image: DecorationImage(
    //                           image: NetworkImage(
    //                             item.imageUrl,
    //                           ),
    //                           fit: BoxFit.cover,
    //                         ),
    //                       ),
    //                     );
    //                   }
    //                   return Card(
    //                     child: Ink(
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(8),
    //                         image: DecorationImage(
    //                           image: NetworkImage(
    //                             "https://cdn.akamai.steamstatic.com/steam/apps/1448440/capsule_616x353.jpg?t=1677225626",
    //                           ),
    //                           fit: BoxFit.cover,
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 },
    //                 itemCount: state is GeburaLoadDone
    //                     ? state.resp.apps.length + 1
    //                     : 1,
    //               ),
    //             ),
    //           ),
    //           Row(
    //             children: [
    //               Expanded(child: SizedBox()),
    //               IconButton(onPressed: () {}, icon: Icon(Icons.arrow_left)),
    //               IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right)),
    //             ],
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
