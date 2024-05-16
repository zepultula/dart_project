import 'package:flutter/material.dart';

//? เรียกหน้า My Home page ที่อยู่ใน screen
import 'package:project_1/screen/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'โปรแกรมแรกของฉัน',

      //? theme หลักของแอป
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      //! home: const MyHomePage(title: 'โปรแกรมแรกของฉัน'),
      home: const MyHomePage(),
    );
  }
}
