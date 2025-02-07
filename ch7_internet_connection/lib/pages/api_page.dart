import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<String> fetchData() async {
  final response =
      await http.get(Uri.parse('https://www.itpart.net/mobile/api/product1.php'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data...');
  }
}

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  late Future<String> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Titles')),
      body: Center(
        child: FutureBuilder<String>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            }
            return SingleChildScrollView(
              child: Text(snapshot.data!),
            );
          },
        ),
      ),
    );
  }
}
