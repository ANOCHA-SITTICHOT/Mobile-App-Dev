import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/calculator_page.dart';
import 'pages/api_page.dart';
import 'pages/detail_page.dart';
import 'pages/my_listpage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/calculator': (context) => const CalculatorPage(),
        '/api': (context) => const ApiPage(),
        '/Productapi': (context) => const DetailPage(productId: 3,),
        '/list': (context) => const MyListPage()

      },
    );
  }
}
