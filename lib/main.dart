import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feature/project/presentation/pages/welcom.dart';

void main(){
  runApp(Main());
}
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen()
    );
  }
}
