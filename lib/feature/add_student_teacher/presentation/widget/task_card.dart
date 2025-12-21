// import 'package:flutter/material.dart';
// import 'package:projectfourthyear/core/common_widget/text_style.dart';
//
// class TaskCard extends StatelessWidget {
//   final String name;
//   final int gender;
//   final String phone;
//
//   const TaskCard({
//     super.key,
//     required this.name,
//     required this.gender,
//     required this.phone,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 5,
//             child: Column(
//               children: [
//                 Text(name, style: AppStyle.dashboard),
//                 SizedBox(height: 10),
//                 Text(gender==0?'male':'female', style: AppStyle.dashboard),
//               ],
//             ),
//           ),
//           Expanded(flex: 5, child: Text(phone, style: AppStyle.dashboard)),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:projectfourthyear/core/common_widget/text_style.dart';

class TaskCard extends StatelessWidget {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int gender;
  final bool isLogIn;

  const TaskCard({
    super.key,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.isLogIn,
  });

  @override
  Widget build(BuildContext context) {
    return
      Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppStyle.dashboard.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(email, style: AppStyle.dashboard.copyWith(fontSize: 14, color: Colors.grey[700])),
                    SizedBox(height: 4),
                    Text(phone, style: AppStyle.dashboard.copyWith(fontSize: 14, color: Colors.grey[700])),
                    SizedBox(height: 4),
                    Text(gender == 0 ? 'Male' : 'Female', style: AppStyle.dashboard.copyWith(fontSize: 14)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: isLogIn
                      ? Icon(Icons.check_circle, color: Colors.green, size: 28)
                      : Icon(Icons.cancel, color: Colors.red, size: 28),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

