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

  void _counterDecrement() {
    setState(() {
      if (_counter < 1) {
        _counter = 0;
      } else {
        _counter--; //? _count = _counter - 1
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Number counter"),
      ),
      body: Center(
        //child: Text("นับไปแล้ว $_counter ครั้ง"),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Text("นับไปแล้ว $_counter ครั้ง", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 180),
                ElevatedButton(
                  onPressed: _counterIncrement,
                  child: const Icon(Icons.add, color: Colors.green, semanticLabel: 'UP',),
                ),
                
                ElevatedButton(
                  onPressed: _counterDecrement,
                  child: const Icon(Icons.remove, color: Colors.red, semanticLabel: 'DOWN',),
                ),
              ],
            ),
          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _counterIncrement,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
      */
    );
  }
}
