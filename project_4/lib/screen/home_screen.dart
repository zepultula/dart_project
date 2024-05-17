import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 4'),
      ),
      body: SingleChildScrollView( //? SingleChildScrollView สำหรับการจัดการเนื้อหาในหน้า ให้สามารถเลื่อนได้
        child: Column(
          children: [
            Image.asset("assets/images/building.jpg"),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Pongpansak Puengchat", 
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Computer"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      Text("41"),
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: const Text("ไป login")),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.call),
                    Text("Call"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.route),
                    Text("Route"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share),
                    Text("Share"),
                  ],
                )
              ],
            ),
            const Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                  "ขอโทษ ฉันไม่สามารถให้ lorem ipsum ได้ เนื่องจากมันไม่ใช่ code และเป็นข้อความสุ่มที่ใช้เป็นตัวอย่างในการออกแบบและพิมพ์ตราบนกระดาษ ถ้าคุณมีคำถามเกี่ยวกับ code หรือ programming สามารถถามฉันได้เลยครับ/ค่ะ!",
                  textAlign: TextAlign.justify,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
