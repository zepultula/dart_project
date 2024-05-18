//! ตอนนี้ยังไม่ถูกเรียกใช่งาน
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert'; // สำหรับการเข้ารหัสและถอดรหัส JSON
import 'package:http/http.dart' as http; // สำหรับการทำ HTTP requests

class JsonExample extends StatefulWidget {
  const JsonExample({super.key});

  @override
  State<JsonExample> createState() => _JsonExampleState();
}

class _JsonExampleState extends State<JsonExample> {
  String _response = '';

   Widget _buildRow(String dataRow) {
    return ListTile(
      title: Text(
        dataRow,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<void> sendData() async {
    final Map<String, dynamic> data = {
      'username': 'example_user',
      'password': 'example_password'
    };

    final String url = 'https://jsonplaceholder.typicode.com/albums';
    // final String url = 'http://10.0.2.15:5001';
    

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          _response = responseData.toString();
        });
      } else {
        setState(() {
          _response = 'Error2: ${response.statusCode}';
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
    return Scaffold(
      appBar: AppBar(title: Text('JSON Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: sendData,
              child: Text('Send Data to PHP'),
            ),
            SizedBox(height: 20),
            Text(_response),
          ],
        ),
      ),
    );
  }
}
