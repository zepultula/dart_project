//? สำหรับส่งไปยัง main.dart

import 'package:flutter/material.dart';
import 'package:project_1/screen/my_second_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Text("data"),
      ),
      appBar: AppBar(title: const Text("สวัสดีชาวโลก")),
      body:  Center(
        child: Column(
          children: [
            const Text("Hello world"),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MySecondPage(),
                  ),
              );
            }, 
            child: const Text("Click me"), 
            ),
          ],
        )
      ),
    ); //? โครงสร้างของหน้าตา
  }
}
