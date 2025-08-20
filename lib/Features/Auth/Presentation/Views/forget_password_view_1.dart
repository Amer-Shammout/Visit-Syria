import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Forget%20Password/forget_password_1_body_consumer.dart';

class ForgetPasswordView1 extends StatelessWidget {
  const ForgetPasswordView1({super.key, this.isChangePass = false});

  final bool isChangePass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPassword1ViewBodyConsumer(isChangePass: isChangePass),
    );
  }
}
