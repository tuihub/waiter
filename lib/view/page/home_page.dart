import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 34, 37),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://cdn.akamai.steamstatic.com/steam/apps/1448440/capsule_616x353.jpg?t=1677225626",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // margin: EdgeInsets.all(32),
                  height: 400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
