import 'package:flutter/material.dart';
import 'package:projectfourthyear/feature/project/presentation/pages/dashboardscreen.dart';
import 'package:projectfourthyear/feature/project/presentation/pages/sign_up.dart';

import '../widget/text_style.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  bool isPasswordVisible = false;

  void signIn() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    final email = emailController.text;
    final password = passController.text;
    print('Email: $email');
    print('Password: $password');

    const correctEmail = 'www.com';
    const correctPassword = '023';
    Future.delayed(Duration(seconds: 3), () {
      if (email == correctEmail && password == correctPassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) {
              return DashBoardScreen();
            },
          ),
        );
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Success'), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xffEAD5FE)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, bottom: 50),
                      child: Text(
                        'Hello\nSign In !',
                        style: AppStyle.signInStudent,
                      ),
                    ),
                  ),
                  Container(
                    height: 600,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80, left: 20),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              label: Text('Gmail', style: AppStyle.textField),
                              suffixIcon: Icon(Icons.check),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email';
                              }

                              // final gmailRegex = RegExp(
                              //   r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
                              // );
                              // if (!gmailRegex.hasMatch(value)) {
                              //   return 'Invalid Email';
                              // }

                              return null; // ✅ valid
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0, left: 20),
                          child: TextFormField(
                            controller: passController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              label: Text(
                                'Password',
                                style: AppStyle.textField,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                child: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                            obscureText: !isPasswordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter password';
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 60,
                            top: 20,
                            right: 20,
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Forget Password?',
                              style: AppStyle.textBold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: signIn,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff7E22CD),

                              borderRadius: BorderRadius.circular(400),
                            ),
                            width: double.infinity,
                            margin: EdgeInsets.all(30),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  'Sign in',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.signInStudent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40, right: 20),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Don't Have Account?",
                              style: AppStyle.accountText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0, right: 20),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return SignUp();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Sign up',
                                style: AppStyle.textBold,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
