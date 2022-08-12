import 'package:flutter/material.dart';
import 'package:my_first_flutter/routeTest/routeTest.dart';

import '../main.dart';
import '../stateTest/mainTest.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute:"/", //名为"/"的路由作为应用的home(首页)
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const RouterTestRoute(),
        "Tip_Route": (context) => const TipRoute(),
        "Parent_WidgetC": (context) => const ParentWidgetC(),
        "My_Home_Page": (context) => MyHomePage(title: ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}

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