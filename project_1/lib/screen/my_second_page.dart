//? หน้าที่สองของ main.dart
import 'package:flutter/material.dart';
import 'package:project_1/screen/my_third_page.dart';
//import 'package:flutter/widgets.dart';

class MySecondPage extends StatelessWidget {
  const MySecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Text("เมนูของหน้าที่ 2"),
      ),
      appBar: AppBar(title: const Text("หน้าที่สองเมนูพิเศษ")),
      body:  Center(
        child: Column(
          children: [
            const Text("รายงานผล"),
            ElevatedButton(onPressed: () {
              // Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyThirdPage(),
                  ),
              );
            }, 
            child: const Text("หน้าถัดไป"), 
            ),
          ], 
        )
      ),
    );
  }
}