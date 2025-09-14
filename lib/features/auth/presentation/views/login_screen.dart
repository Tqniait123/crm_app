import 'package:crm_app/core/utils/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [LogoWidget(type: LogoType.wide)]),
    );
  }
}
