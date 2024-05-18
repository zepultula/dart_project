import 'dart:async';
import 'dart:convert';
 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
 
  @override
  _MyAppState createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp> {
  late Future<dynamic> futureAlbum;

//? ด้านล่างเป็น Code ที่เชื่อมต่อ API โดยใช้ http.get เพื่อดึงข้อมูลแบบ Get จากนั้นก็ return ค่า response โดยใช้ประเภท Future เทียบกับภาษาอื่นๆ ประเภทข้อมูลนี้ก็คือ CallBack นั้นเองครับ เอาไว้อ่านค่าที่ได้จาก api เมื่อได้ข้อมูลมาแล้ว (ในอนาคต ไม่รู้ตอนไหน เมื่อเสร็จจะบอก ประมาณนั้น) ซึ่งข้างในเป็นค่าประเภท dynamic ที่ได้จาก jsonDecode
Future<dynamic> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
 
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

//? ตรงนี้เป็นการสร้าง Widget สำหรับแสดงข้อมูลเป็นแถวๆ
  Widget _buildRow(String dataRow) {
  return ListTile(
    title: Text(
      dataRow,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
 
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
 //?  แสดงผลในรูปแบบ ListView เมื่อได้ข้อมูลจาก API 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<dynamic>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(//สร้าง Widget ListView
                    padding: EdgeInsets.all(16.0),
                    itemBuilder: (context, i) {
                       //หากไม่สร้าง Object สามารถเรียกใช้งานแบบนี้ได้เลย
                      return _buildRow(snapshot.data[i]["title"].toString()); 
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
 
              // รูป Spiner ขณะรอโหลดข้อมูล
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}