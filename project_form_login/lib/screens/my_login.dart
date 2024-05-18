import 'package:flutter/material.dart';
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

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    // ตรวจสอบรหัสผ่านหรือดำเนินการใด ๆ ที่จำเป็นก่อนการเข้าสู่ระบบ

    // นำทางไปยังหน้า HomePage และส่งค่าชื่อผู้ใช้
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(username: username, password: password),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/spa_logo.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _usernameController, //? การเชื่อมโยงตัวแปร usernameController กับ _usernameController
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ชื่อผู้ใช้งาน',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController, //? การเชื่อมโยงตัวแปร passwordController กับ _passwordController
                obscureText: _obscureText, //? ปิดการแสดงรหัสผ่าน
                obscuringCharacter: '*', //? การเปลี่ยนรหัสผ่าน
                decoration: InputDecoration(
                  border: const OutlineInputBorder(), //? สร้างเส้นขอบ
                  labelText: 'รหัสผ่าน',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _login,
                child: const Text('เข้าสู่ระบบ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
