import 'package:flutter/material.dart';
import 'package:projectfourthyear/feature/project/presentation/pages/sign_in.dart';

import '../widget/text_style.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24, bottom: 50),
                    child: Text(
                      'Create your \nAccount',
                      style:AppStyle.signInStudent
                    ),
                  ),
                ),
                Container(
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
                        padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsetsGeometry.only(left: 20),
                            labelText: 'Full Name',
                            labelStyle: AppStyle.textField,
                            suffixIcon:  Icon(Icons.check),
                          ),
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if(value!.length>20){
                              return "don't have this long";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40,left: 10,right: 10),

                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            label: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('Gmail', style: AppStyle.textField),
                            ),
                            suffixIcon: const Icon(Icons.check),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            }

                            final gmailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
                            );
                            if (!gmailRegex.hasMatch(value)) {
                              return 'Invalid Email';
                            }

                            return null; // ✅ valid
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0,left: 10,right: 10),
                        child: TextFormField(
                          controller: passController,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            label: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child:  Text(
                                'Password',
                                style: AppStyle.textField,
                              ),
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
                            if (value.length < 8) {
                              return 'error in password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0,left: 10,right: 10),
                        child: TextFormField(
                          controller: confirmController,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            label: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child:  Text(
                                'Confirm Password',
                                style:AppStyle.textField,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isConfirmPasswordVisible = !isConfirmPasswordVisible;
                                });
                              },
                              child: Icon(
                                isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          obscureText: !isConfirmPasswordVisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter password';
                            }
                            if (value!=passController.text  ) {
                              return 'error in password';
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
                            style: AppStyle.textBold
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) {
                          //       return SizedBox();
                          //     },
                          //   ),
                          // );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(156, 19, 47, 1),
                                Color.fromRGBO(35, 20, 45, 1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(400),
                          ),
                          width: double.infinity,
                          margin: EdgeInsets.all(30),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Sign up',
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
                            style: AppStyle.accountText
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
                                    return SignIn();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
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
    );
  }
}
