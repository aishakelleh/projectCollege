import 'package:flutter/material.dart';
import 'package:projectfourthyear/feature/project/presentation/pages/sign_up.dart';

import '../widget/text_style.dart';
import 'sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(156, 19, 47, 1),
              Color.fromRGBO(35, 20, 45, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Icon(Icons.fit_screen, color: Colors.white, size: 50),
            ),
            Text(' Roh Al Ataa', style: AppStyle.nameCollege),
            const SizedBox(height: 150),
            Text('Welcome Back', style: AppStyle.welcomeBack),
            const SizedBox(height: 20),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SignIn();
                      },
                    ),
                  );
                },
                child: Text('SING IN', style: AppStyle.signIn),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SignUp();
                      },
                    ),
                  );
                },
                child: Text('SING UP', style: AppStyle.signUp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
