import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Obs Status',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Obs Status'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
