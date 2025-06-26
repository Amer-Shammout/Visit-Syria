import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Sign%20Up/sign_up_view_body_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignUpViewBodyConsumer());
  }
}
