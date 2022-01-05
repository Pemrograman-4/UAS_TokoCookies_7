import 'package:flutter/material.dart';
import 'package:zahira_cantika_c_19411005/ui/login.dart';
import 'package:zahira_cantika_c_19411005/ui/startup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'tokocookies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: StartUp()
    );
  }
}
