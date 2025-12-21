import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectfourthyear/core/common_widget/text_style.dart';
import 'package:projectfourthyear/core/theme/app_color.dart';
import 'package:projectfourthyear/feature/add_student_teacher/model/add_student/request/request_student.dart';
import 'package:projectfourthyear/feature/add_student_teacher/presentation/cubit/add_student_cubit.dart';
import 'package:projectfourthyear/feature/add_student_teacher/presentation/cubit/add_student_state.dart';
import 'package:projectfourthyear/feature/add_student_teacher/presentation/widget/custom_drawer.dart';

import '../../../../core/common_widget/custom_textformfield.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  final formKey = GlobalKey<FormState>();
  String? selectedGender;
  int? selectedRole;
  bool isPasswordVisible = false;
  late var nameController = TextEditingController();
  late var emailController = TextEditingController();
  late var phoneController = TextEditingController();
  late var passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.purple,
        title: Text('Student Management', style: AppStyle.signInStudent),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications, size: 29, color: Colors.black),
          ),
        ],
      ),
      drawer: Padding(
        padding: EdgeInsets.only(right: 150.w, top: 50.h),
        child: CustomDrawer(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text('Student Information', style: AppStyle.textField),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextformfield(
                  suffix: Icon(Icons.person),
                  controller: nameController,
                  title: 'name',
                  validator: (value) =>
                  (value?.isEmpty ?? true) ? 'enter your name' : null,
                  type: TextInputType.text,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextformfield(
                  suffix: Icon(Icons.email),
                  controller: emailController,
                  title: 'email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null; // ✅ valid,
                  },
                  type: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextformfield(
                  suffix: Icon(Icons.phone),
                  pref: '+963',
                  controller: phoneController,
                  title: 'phone',
                  type: TextInputType.phone,
                  validator: (v) => v!.isEmpty ? "Required" : null,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextformfield(
                  suffix: InkWell(
                    onTap: () =>
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        }),
                    child: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  obscureT: !isPasswordVisible,
                  controller: passController,
                  title: 'password',
                  validator: (value) =>
                  (value?.isEmpty ?? true) ? 'Please enter password' : null,
                  type: TextInputType.visiblePassword,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  value: selectedRole,
                  items: [
                    DropdownMenuItem(value: 1, child: Text('1')),
                    DropdownMenuItem(value: 2, child: Text('2')),
                    DropdownMenuItem(value: 3, child: Text('3')),
                  ],
                  onChanged: (value) => selectedRole = value,
                  decoration: InputDecoration(
                    labelText: 'role',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please choose role';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: selectedGender,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(value: "male", child: Text("Male")),
                    DropdownMenuItem(value: "female", child: Text("Female")),
                  ],
                  onChanged: (value) {
                    selectedGender = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please choose gender';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              BlocListener<AddStudentCubit, AddStudentState>(
                  listener: (context, state) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('successfully'),
                        backgroundColor: Colors.green,));
                    }
                    Navigator.of(context).pop();
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      final valueInt = selectedGender == 'male' ? 1 : 2;
                      final request = RequestStudent(
                        name: nameController.text,
                        email: emailController.text,
                        password: passController.text,
                        phone: phoneController.text,
                        role: selectedRole!,
                        gender: valueInt,
                      );
                      context.read<AddStudentCubit>().createStudents(
                        requestStudent: request,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.purple,
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 100,
                      ),
                    ),
                    child: Text('Add Student', style: AppStyle.signUp),
                  )

              ),
            ],
          ),
        ),
      ),
    );
  }
}
