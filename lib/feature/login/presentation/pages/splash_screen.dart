import 'package:flutter/material.dart';
import 'package:projectfourthyear/feature/login/presentation/pages/onboard_screen.dart';

import '../../../../core/common_widget/text_style.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return OnboardScreen();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/photo_2025-10-27_19-23-54.jpg'),
              const SizedBox(height: 20),
               Text(
                'Welcome to \nAl Farabi Institute',
                textAlign: TextAlign.center,
                style: AppStyle.farabi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
