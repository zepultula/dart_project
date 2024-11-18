//? สำหรับส่งค่าต่างๆ ไปยังหน้าถัดไป

import 'package:flutter/material.dart';
import 'package:project_1/screen/my_home_page.dart';

class MyThirdPage extends StatelessWidget {
  const MyThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("หน้าที่สาม"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("รายงานผลการเปิดหน้าที่ 3 เรียบร้อยแล้ว"),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                )
              );
            }, child: const Text("กลับสู่หน้าหลัก"),)
          ]
        )
      ),
    );
  }
}
