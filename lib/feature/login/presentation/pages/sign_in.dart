import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectfourthyear/feature/login/model/login_request/login_request.dart';
import 'package:projectfourthyear/feature/login/presentation/cubit/login/login_cubit.dart';
import 'package:projectfourthyear/feature/add_student_teacher/presentation/pages/dashboardscreen.dart';
import 'package:projectfourthyear/feature/login/presentation/pages/sign_up.dart';

import 'package:projectfourthyear/core/theme/app_color.dart';
import '../cubit/login/login_state.dart';
import '../../../../core/common_widget/text_style.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('success in logIn'),
                backgroundColor: Colors.green,
              ),

            );


            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return DashBoardScreen();
                },
              ),
            );
          } else if (state.status == Status.failure) {
            print('❌ فشل تسجيل الدخول: ${state.errorMessage}');

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('error in logIn'),
                backgroundColor: Colors.red,
              ),
            );
          }



        },
        child: Container(
          width: double.infinity,
          decoration:  BoxDecoration(color: AppColor.white),
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
                      height: 600.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          topRight: Radius.circular(50.r),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 80.h, left: 20.w),
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
                                //
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
                            padding: EdgeInsets.only(top: 40.h, left: 20.w),
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
                              bottom: 60.h,
                              top: 20.h,
                              right: 20.w,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Forget Password?',
                                style: AppStyle.textBold,
                              ),
                            ),
                          ),
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              bool isLoading = state.status == Status.loading;
                              if (isLoading) {
                                return const CircularProgressIndicator();
                              }
                              return GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    final request = LoginRequest(
                                      email: emailController.text,
                                      password: passController.text,
                                    );
                                    context.read<LoginCubit>().signIn(
                                      loginRequest: request,
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.purple,

                                    borderRadius: BorderRadius.circular(400.r),
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
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.h, right: 20.w),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Don't Have Account?",
                                style: AppStyle.accountText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.h, right: 20.w),
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
      ),
    );
  }
}
