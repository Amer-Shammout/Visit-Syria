import 'package:flutter/material.dart';

class KeyboardUnfocusOnHide extends StatefulWidget {
  final Widget child;
  const KeyboardUnfocusOnHide({super.key, required this.child});

  @override
  State<KeyboardUnfocusOnHide> createState() => _KeyboardUnfocusOnHideState();
}

class _KeyboardUnfocusOnHideState extends State<KeyboardUnfocusOnHide>
    with WidgetsBindingObserver {
  double _lastBottom = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _lastBottom = WidgetsBinding.instance.platformDispatcher.views.first.viewInsets.bottom;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottom = WidgetsBinding.instance.platformDispatcher.views.first.viewInsets.bottom;
    if (_lastBottom > 0 && bottom == 0) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    _lastBottom = bottom;
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
