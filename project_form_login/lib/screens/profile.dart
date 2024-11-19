
import 'dart:convert'; // การแปลงข้อมูลจาก JSON, XML, URL encoded, Base64 เป็น Object และกลับกัน
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_form_login/screens/home_page.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String password;

  const ProfilePage({super.key, required this.username, required this.password});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  // ฟังก์ชันที่ใช้ดึงข้อมูลโปรไฟล์จาก API
  Future<String> _loadProfile() async {
    final url = Uri.parse('http://zepultula.3bbddns.com:25102/api.php');
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({"name": widget.username});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        try {
          final responseData = jsonDecode(response.body);
          final message = responseData['message'] ?? 'No message in response';
          return message;
        } catch (e) {
          return 'Invalid response format: $e';
        }
      } else {
        try {
          final responseData = jsonDecode(response.body);
          final message = responseData['message'] ?? 'No message in response';
          return 'Error ${response.statusCode}: $message';
        } catch (e) {
          return 'Error ${response.statusCode}: ${response.body}';
        }
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  // ฟังก์ชันสำหรับแสดง AlertDialog
  void _showAlertDialog(String message) {
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: true, // อนุญาตให้ปิด Dialog ด้วยการกดพื้นที่ว่าง
        builder: (context) => AlertDialog(
          title: const Text('รายงานจากระบบ'),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // ฟังก์ชันจัดการการเปลี่ยนหน้าเมื่อกด BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                  username: widget.username, password: widget.password)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว ${widget.username}'),
      ),
      body: FutureBuilder<String>(
        future: _loadProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Center(child: Text(snapshot.data ?? 'No data'));
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 67, 145, 218)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color.fromARGB(255, 67, 145, 218)),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
