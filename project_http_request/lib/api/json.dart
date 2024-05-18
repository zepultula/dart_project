import 'package:flutter/material.dart';
import 'dart:convert'; // สำหรับการเข้ารหัสและถอดรหัส JSON
import 'package:http/http.dart' as http; // สำหรับการทำ HTTP requests

class JsonExample extends StatefulWidget {
  const JsonExample({super.key});

  @override
  State<JsonExample> createState() => _JsonExampleState();
}

class _JsonExampleState extends State<JsonExample> {
  String _response = '';

  Future<void> sendData() async {
    // ข้อมูลที่จะส่งไปยัง PHP
    final Map<String, dynamic> data = {
      'username': 'example_user',
      'password': 'example_password'
    };

    // URL ของ PHP script บนเซิร์ฟเวอร์
    final String url = 'http://academic.tak.rmutl.ac.th/moblies/api/api.php';

    try {
      // ส่งข้อมูลในรูปแบบ JSON โดยใช้ POST request
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      // ตรวจสอบสถานะของคำตอบ
      if (response.statusCode == 200) {
        // ถอดรหัสข้อมูล JSON ที่ได้รับ
        final responseData = json.decode(response.body);
        setState(() {
          _response = responseData.toString();
        });
      } else {
        setState(() {
          _response = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: sendData,
          child: Text('Send Data to PHP'),
        ),
        SizedBox(height: 20),
        Text(_response),
      ],
    );
  }
}