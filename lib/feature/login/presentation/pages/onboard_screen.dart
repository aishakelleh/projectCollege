import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:projectfourthyear/feature/login/presentation/pages/sign_in.dart';

import 'package:projectfourthyear/core/theme/app_color.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  Widget buildImage(String assetsName) {
    return Image.asset('assets/image/$assetsName');
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = TextStyle(fontSize: 19, color: CupertinoColors.black);
    var titleStyle = TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.purple,
    );
    var bodyDecoration = PageDecoration(
      bodyPadding: EdgeInsets.fromLTRB(8, 0, 8, 8),
      imagePadding: EdgeInsets.zero,
      pageColor: AppColor.white,
      bodyTextStyle: bodyStyle,
      titleTextStyle: titleStyle,
    );
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'جدولك الدراسي بلمسة زر',
          body: 'تابع جدول محاضراتك اليومية والأسبوعية بسهولة ودون أي تعقيد',
          image: buildImage('online_learning_v1.png'),
          decoration: bodyDecoration,
        ),
        PageViewModel(
          title: 'تواصل مباشر مع مدرسيك',
          body:
              'اطرح أسئلتك واحصل على إجابات سريعة من خلال نظام الرسائل المباشر',
          image: buildImage('online_learning_v2.png'),
          decoration: bodyDecoration,
        ),
        PageViewModel(
          title: 'تابع تقدمك الأكاديمي',
          body: 'اطلع على درجاتك وواجباتك وكن على دراية كاملة بمستواك الدراسي',
          image: buildImage('online_learning_v3.webp'),
          decoration: bodyDecoration,
        ),
      ],
      onDone: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return SignIn();
          },
        ),
      ),
      skip: Text(
        'skip',
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
      ),
      onSkip: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return SignIn();
          },
        ),
      ),
      next: Icon(Icons.arrow_forward, color: AppColor.purple),
      done: Text(
        'start now',
        style: TextStyle(fontWeight: FontWeight.w600, color: AppColor.purple),
      ),
      dotsDecorator: DotsDecorator(
        size: Size(10.w, 10.h),
        color: AppColor.page,
        activeColor: AppColor.purple,
        activeSize: Size(22.w, 10.h),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25.r),
        ),
      ),
    );
  }
}
