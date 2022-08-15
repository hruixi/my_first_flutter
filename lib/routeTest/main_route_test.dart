import 'package:flutter/material.dart';
import 'package:my_first_flutter/routeTest/routeTest.dart';

import '../main.dart';
import '../stateTest/mainTest.dart';

class RouterTestRoute extends StatelessWidget {
  const RouterTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // var result = await Navigator.pushNamed(context, "Tip_Route");
              Navigator.of(context).pushNamed("My_Home_Page", arguments: "三千世界，大道发生 🐂🍺");
            },
            child: const Text("打开提示页"),
          ),
          const Text("gi gi gi")
        ],
      )
    );
  }
}