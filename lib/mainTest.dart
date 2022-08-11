import 'package:flutter/material.dart';

// void main() {
//   runApp(const TestApp());
// }

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // title: 'Flutter Test',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ParentWidgetC(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapboxB(
      active: _active,
      onChanged: _handleTapboxChanged,
    );
  }
}

class TapboxB extends StatelessWidget {
  const TapboxB({Key? key, this.active = false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[800],
          ),
          child: Center(
            child: Text(
              active ? 'Active' : 'Inactive',
              style: const TextStyle(fontSize: 28.6, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

// TapboxA 管理自身状态.
class TapboxA extends StatefulWidget {
  const TapboxA({Key? key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Center(
          child: Container(
            width: 180.0,
            height: 180.0,
            decoration: BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600],
            ),
            child: Center(
              child: Text(
                _active ? 'Active' : 'Inactive',
                style: const TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
          ),
        ));
  }
}

//---------------------------- 混合管理状态 ----------------------------
class ParentWidgetC extends StatefulWidget {
  const ParentWidgetC({Key? key}) : super(key: key);

  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapboxC(
      active: _active,
      onChanged: _handleTapboxChanged,
    );
  }
}

//-----------  TapboxC -----------
class TapboxC extends StatefulWidget {
  TapboxC({Key? key, this.active: false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return GestureDetector(
        onTapDown: _handleTapDown,
        // 处理按下事件
        onTapUp: _handleTapUp,
        // 处理抬起事件
        onTapCancel: _handleTapCancel,
        onTap: _handleTap,
        child: Center(
          child: Container(
            width: 250.0,
            height: 250.0,
            decoration: BoxDecoration(
              color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
              border: _highlight
                  ? Border.all(
                      color: const Color(0xFF6200EA),
                      width: 25.0,
                    )
                  : null,
            ),
            child: Center(
              child: Text(
                widget.active ? 'Active' : 'Inactive',
                style: const TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
