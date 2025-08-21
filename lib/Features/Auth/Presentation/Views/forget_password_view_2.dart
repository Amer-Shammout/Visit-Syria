import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Forget%20Password/forget_password_2_body_consumer.dart';

class ForgetPasswordView2 extends StatelessWidget {
  const ForgetPasswordView2({
    super.key,
    required this.email,
    required this.isChangePass,
  });

  final String email;
  final bool isChangePass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPassword2ViewBodyConsumer(
        email: email,
        isChangePass: isChangePass,
      ),
    );
  }
}
