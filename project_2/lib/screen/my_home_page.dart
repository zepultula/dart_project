import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _counterIncrement() {
    setState(() {
      _counter++; //? _count = _counter + 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Increment counter"),
      ),
      body: Center(
        child: Text("นับไปแล้ว $_counter ครั้ง"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterIncrement,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
