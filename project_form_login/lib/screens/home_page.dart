import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String password;


  HomePage({required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body and SPA Tak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          // child: Text('Welcome, $username!, $password'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('ส่วนการจัดการสมาชิก', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 46, 46, 46))),
              const SizedBox(height: 20),
              Image.asset('assets/images/dash_board_title.jpg'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
