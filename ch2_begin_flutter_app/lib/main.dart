import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.pinkAccent[400]),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Introduction'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Me',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Name: Anocha',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Age: 20',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Hobbies: Reading, Coding',
                style: TextStyle(fontSize: 18),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}