import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .28,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/test.jpg'),
          fit: BoxFit.cover,
        ),

        borderRadius: BorderRadius.circular(32),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),

        gradient: LinearGradient(
          begin: Alignment(0.50, -0.00),
          end: Alignment(0.50, 1.00),
          colors: [
            Colors.black.withValues(alpha: .01),
            Colors.black.withValues(alpha: .03),
            Colors.black.withValues(alpha: .07),
            Colors.black.withValues(alpha: .13),
            Colors.black.withValues(alpha: .20),
            Colors.black.withValues(alpha: .28),
            Colors.black.withValues(alpha: .38),
            Colors.black.withValues(alpha: .47),
            Colors.black.withValues(alpha: .57),
            Colors.black.withValues(alpha: .65),
            Colors.black.withValues(alpha: .72),
            Colors.black.withValues(alpha: .78),
            Colors.black.withValues(alpha: .82),
            Colors.black.withValues(alpha: .84),
            Colors.black.withValues(alpha: .85),
          ],
        ),
      ),
    );
  }
}
