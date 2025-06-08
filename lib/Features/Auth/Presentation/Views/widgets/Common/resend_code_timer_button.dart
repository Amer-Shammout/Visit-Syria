import 'dart:async';
import 'package:flutter/material.dart';

class ResendCodeTimerButton extends StatefulWidget {
  final int initialSeconds;
  final VoidCallback onResend;
  final String activeText;
  final String waitingTextPrefix;
  final Color activeColor;
  final Color disabledColor;

  const ResendCodeTimerButton({
    super.key,
    required this.onResend,
    this.initialSeconds = 30,
    this.activeText = "إعادة الإرسال",
    this.waitingTextPrefix = "إعادة الإرسال خلال",
    this.activeColor = Colors.blue,
    this.disabledColor = Colors.grey,
  });

  @override
  State<ResendCodeTimerButton> createState() => _ResendCodeTimerButtonState();
}

class _ResendCodeTimerButtonState extends State<ResendCodeTimerButton> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingSeconds = widget.initialSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        setState(() {});
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _handleResend() {
    widget.onResend();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWaiting = _remainingSeconds > 0;

    return TextButton(
      onPressed: isWaiting ? null : _handleResend,
      style: TextButton.styleFrom(
        foregroundColor: isWaiting ? widget.disabledColor : widget.activeColor,
      ),
      child: Text(
        isWaiting
            ? "${widget.waitingTextPrefix}: 00:${_remainingSeconds.toString().padLeft(2, '0')}"
            : widget.activeText,
      ),
    );
  }
}
