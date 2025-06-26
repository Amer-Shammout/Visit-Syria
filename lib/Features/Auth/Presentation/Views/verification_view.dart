import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Verification/verification_view_body_consumer.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, required this.authRequestModel});

  final AuthRequestModel authRequestModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: VerificationViewBodyConsumer(authModel:authRequestModel));
  }
}
