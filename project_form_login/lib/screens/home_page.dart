import 'package:flutter/material.dart';
import 'package:project_form_login/screens/my_login_api.dart';
import 'package:project_form_login/screens/profile.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String password;

  HomePage({required this.username, required this.password});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2; //? เริ่มที่ 2
  dynamic colorS;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index == 3){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:(context) => ProfilePage(
              username: widget.username, 
              password: widget.password),
          )
        );
      }
    });
  }

  void _logout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyLogin(),
      ),
    );
  }

  void _viewProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          username: widget.username, //? ใช้ widget เพื่อเข้าถึงตัวแปร
          password: widget.password,
          ),
      ),
    );
  }

//? สร้าง widjet ในการเรียกใช้งานการ์ด
  Widget _buildNotificationCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text('แจ้งเตือน'),
            subtitle: Text('สวัสดี รายการแจ้งเตือนตอนนี้ไม่มี!'),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('ปิด'),
                onPressed: () {
                  Navigator.pop(context); // ปิด AlertDialog
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showNotificationCard() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: _buildNotificationCard(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body and SPA TAK'),
        actions: [
          IconButton(
            onPressed: _showNotificationCard,
            icon: Stack(
              children: <Widget>[
                const Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _viewProfile,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      drawer: const Drawer(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("เมนูของหน้าที่ 2"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ส่วนการจัดการสมาชิก',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/images/dash_board_title.jpg'),
              const SizedBox(height: 20),
              const Text(
                'การนวดเพื่อสุขภาพเป็นทางเลือกที่ยอดเยี่ยมในการดูแลรักษาสุขภาพทั้งกายและจิตในสมัยที่เรามีการดูแลตนเองอย่างเป็นระบบมากขึ้น ด้วยประสบการณ์การนวดที่ถูกต้องและมืออาชีพ การนวดสามารถเพิ่มระบบภูมิคุ้มกันของร่างกาย ลดความเครียดและความตึงเครียด และช่วยผ่อนคลายกล้ามเนื้อและข้อต่อที่เคลื่อนไหวได้ดีขึ้น \n \n การนวดไม่เพียงแต่เป็นการปรับปรุงการไหลเวียนของเลือดและการทำงานของระบบประสาท แต่ยังเป็นการสร้างสัมพันธภาพระหว่างผู้นวดและผู้รับการนวด ด้วยการสัมผัสที่อ่อนโยนและการสื่อสารที่ดี การนวดมีผลกระทบทางจิตวิญญาณอย่างมหาศาล', //? ข้อความ
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_to_queue, color: Color.fromARGB(255, 67, 145, 218)),
            label: 'จองคิว',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color.fromARGB(255, 67, 145, 218)),
            label: 'ค้นหา',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 67, 145, 218)),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.summarize, color: Color.fromARGB(255, 67, 145, 218)),
            label: 'ตรวจ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share, color: Color.fromARGB(255, 67, 145, 218)),
            label: 'แบ่งปัน',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red, // สีเมื่อเลือก
        unselectedItemColor: const Color.fromARGB(255, 46, 46, 46), // สีเมื่อไม่ถูกเลือก
        onTap: _onItemTapped, //? เมื่อมีการเรียก tap มันจะดูว่าเป็น index ที่เ่าไร มันจะไปเปรียบเทียบฟังก์ชั่นเพื่อเรียกใช้งาน
      ),
    );
  }
}
