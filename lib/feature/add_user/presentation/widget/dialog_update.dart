import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectfourthyear/core/common_widget/text_style.dart';
import 'package:projectfourthyear/core/theme/app_color.dart';


import '../../../../core/common_widget/custom_textformfield.dart';
import '../../model/add_user/request/request_user.dart';
import '../../model/add_user/response/response_user.dart';
import '../cubit/add_user_cubit.dart';
import '../cubit/add_user_state.dart';
import 'custom_drawer.dart';

class DialogUpdate extends StatefulWidget {
  const DialogUpdate({super.key, required this.user});

  final ResponseUser user;

  @override
  State<DialogUpdate> createState() => _DialogUpdateState();
}

class _DialogUpdateState extends State<DialogUpdate> {
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
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone);
    passController = TextEditingController();
    selectedRole= widget.user.role;
    selectedGender=widget.user.gender==1?'male':'female';
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
        title: Text('User Management', style: AppStyle.signInStudent),
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
                child: Text('User Information', style: AppStyle.textField),
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
                    onTap: () => setState(() {
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
                    DropdownMenuItem(value: 2, child: Text('Teacher')),
                    DropdownMenuItem(value: 3, child: Text('Student')),
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
              BlocListener<AddUserCubit, AddUserState>(
                listener: (context, state) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                  Navigator.of(context).pop();
                },
                child: ElevatedButton(
                  onPressed: () {
                    final valueInt = selectedGender == 'male' ? 1 : 2;
                    final request = RequestUser(
                      name: nameController.text,
                      email: emailController.text,
                      password: passController.text,
                      phone: phoneController.text,
                      role: selectedRole!,
                      gender: valueInt,
                    );
                    context.read<AddUserCubit>().updateUser(
                      widget.user.id,
                      request,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.purple,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 100,
                    ),
                  ),
                  child: Text('Edit Student', style: AppStyle.signUp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
