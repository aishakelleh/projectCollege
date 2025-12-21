import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.name,
    required this.gender,
    required this.phone,
  });

  final String name;
  final String gender;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(15),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(2),
      child: ListTile(
         title: Text(name),
         subtitle: Text(gender),
         trailing: Text(phone),
      ),
    );
  }
}
