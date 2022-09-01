import 'package:flutter/material.dart';

class WillPopScopeDemo extends StatefulWidget {
  const WillPopScopeDemo({Key? key}) : super(key: key);

  @override
  WillPopScopeTestRouteState createState() => WillPopScopeTestRouteState();
}

class WillPopScopeTestRouteState extends State<WillPopScopeDemo> {
  DateTime? _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("返回拦截"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt!) > const Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: const Text("1秒内连续按两次返回键退出"),
        ),
      ),
    );
  }
}