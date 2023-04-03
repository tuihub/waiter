import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';
import 'package:waitress/common/const/color.dart';

class GeburaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiRequestBloc, ApiRequestState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is! GeburaState) {
          context.read<ApiRequestBloc>().add(GeburaLoadEvent(ListAppRequest()));
        }
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ink(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "# ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 28,
                        ),
                      ),
                      TextSpan(
                        text: "GEBURA ",
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.zero,
                  child: GridView.builder(
                    padding: EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 144),
                    itemBuilder: (BuildContext context, int index) {
                      if (state is GeburaLoadDone) {
                        if (index == state.resp.appList.length) {
                          return Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                            child: Center(
                              child: Text("没有了"),
                            ),
                          );
                        }
                        final item = state.resp.appList.elementAt(index);
                        return Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(
                                item.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                      return Card(
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://cdn.akamai.steamstatic.com/steam/apps/1448440/capsule_616x353.jpg?t=1677225626",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: state is GeburaLoadDone
                        ? state.resp.appList.length + 1
                        : 1,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_left)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
