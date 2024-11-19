import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_form_login/screens/home_page.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _obscureText = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _message;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _login() async {
    // final url = Uri.parse('http://192.168.1.29/login.php'); // เปลี่ยน URL ให้เป็น URL ของเซิร์ฟเวอร์จริง
    final url = Uri.parse(
        'http://zepultula.3bbddns.com:25102/login.php'); // เปลี่ยน URL ให้เป็น URL ของเซิร์ฟเวอร์จริง

    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({
      "username": _usernameController.text,
      "password": _passwordController.text,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success') {
          _showSuccessDialog(responseData['message']);

          //todo ไปยังหน้า HomePage พร้อมส่งข้อมูล
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                username: _usernameController.text,
                password: _passwordController.text,
              ),
            ),
          );
        } else {
          _showErrorDialog(responseData['message']);
        }
      } else {
        _showErrorDialog('Error: ${response.statusCode}');
      }
    } catch (e) {
      _showErrorDialog('Error: $e');
    }
  }

  //? สำหรับกล่องข้อความที่จะแสดงเมื่อ login สําเร็จ
  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Successful'),
        content: Text(message),
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

  //? สำหรับกล่องข้อความที่จะแสดงเมื่อ login ไม่สําเร็จ
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ยืนยันตัวตนไม่สำเร็จ'),
        content: Text(message),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, //? ทำให้ Stack ขยายเต็มหน้าจอ
        children: [
          //? เพิ่มพื้นหลัง
          Image.asset(
            'assets/images/logo_arit_tak.png',
            fit: BoxFit.cover,
          ),
          //? เพิ่นพื้นหลังอื่นๆ เพื่อทับภาพนี้
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_arit_tak.png',
                    width: 100,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      labelText: 'ชื่อผู้ใช้งาน',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      labelText: 'รหัสผ่าน',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('เข้าสู่ระบบ'),
                  ),
                  if (_message != null) ...[
                    const SizedBox(height: 20),
                    Text(
                      _message!,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
