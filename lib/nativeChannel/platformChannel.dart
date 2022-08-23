import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformChannel extends StatefulWidget {
  const PlatformChannel({Key? key}) : super(key: key);

  @override
  State<PlatformChannel> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PlatformChannel> {
  static const platform = MethodChannel('samples.flutter.io/battery');

  // Get battery level.
  String _batteryLevel = '电池电量未知.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = "电池电量为 $result%";
    } on PlatformException catch (e) {
      batteryLevel = "无法获取电池电量: '${e.message}'";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('获取手机电量'),
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }

}