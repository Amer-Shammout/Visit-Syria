import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class ShakeWidget extends StatefulWidget {
  final Widget child;
  final bool shake;
  final int shakes;
  final double offset;
  final Duration duration;
  final Duration interval;

  const ShakeWidget({
    super.key,
    required this.child,
    this.shake = false,
    this.shakes = 3,
    this.offset = 8.0,
    this.duration = const Duration(milliseconds: 700),
    this.interval = const Duration(milliseconds: 2000),
  });

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    if (widget.shake) {
      _startShaking();
    }
  }

  void _startShaking() {
    _timer?.cancel();
    _timer = Timer.periodic(widget.interval, (_) {
      if (mounted && widget.shake) {
        _controller.forward(from: 0);
      }
    });

    _controller.forward(from: 0);
  }

  void _stopShaking() {
    _timer?.cancel();
    _controller.stop();
    _controller.value = 0;
  }

  @override
  void didUpdateWidget(covariant ShakeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shake && !oldWidget.shake) {
      _startShaking();
    } else if (!widget.shake && oldWidget.shake) {
      _stopShaking();
    }
  }

  @override
  void dispose() {
    _stopShaking();
    _controller.dispose();
    super.dispose();
  }

  double _shakeTransform(double progress) {
    return widget.offset * math.sin(progress * widget.shakes * math.pi * 2);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakeTransform(_animation.value), 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
