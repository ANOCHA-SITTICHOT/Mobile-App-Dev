import 'package:flutter/material.dart';
import '../stateful/my_widget.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Page'),
      ),
      body: const MyWidget(),
    );
  }
}
