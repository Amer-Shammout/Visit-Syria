import 'package:flutter/material.dart';

class ConditionalBlink extends StatefulWidget {
  final Widget child;
  final String? state;
  final List<String> blinkingStates;
  final Duration duration;
  final double beginOpacity;
  final double endOpacity;

  const ConditionalBlink({
    super.key,
    required this.child,
    this.state,
    this.blinkingStates = const ['Pending'],
    this.duration = const Duration(milliseconds: 800),
    this.beginOpacity = 1.0,
    this.endOpacity = 0.6,
  });

  @override
  State<ConditionalBlink> createState() => _ConditionalBlinkState();
}

class _ConditionalBlinkState extends State<ConditionalBlink>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  bool get shouldBlink =>
      widget.state != null && widget.blinkingStates.contains(widget.state);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _opacity = Tween<double>(
      begin: widget.beginOpacity,
      end: widget.endOpacity,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (shouldBlink) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant ConditionalBlink oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (shouldBlink && !_controller.isAnimating) {
      _controller.repeat(reverse: true);
    } else if (!shouldBlink && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return shouldBlink
        ? FadeTransition(opacity: _opacity, child: widget.child)
        : widget.child;
  }
}
