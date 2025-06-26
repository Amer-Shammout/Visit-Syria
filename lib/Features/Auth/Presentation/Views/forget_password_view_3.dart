import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Forget%20Password/forget_password_3_body_consumer.dart';

class ForgetPasswordView3 extends StatelessWidget {
  const ForgetPasswordView3({super.key, required this.verificationModel});

  final VerificationModel verificationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ForgetPassword3ViewBodyConsumer(verificationModel:verificationModel));
  }
}
