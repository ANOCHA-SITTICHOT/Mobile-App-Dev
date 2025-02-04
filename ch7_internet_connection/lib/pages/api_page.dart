import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<String>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonBody = json.decode(response.body);
    
    List<dynamic> products = jsonBody['products'];
    
    List<String> productTitles = products.map((product) => product['title'].toString()).toList();

    return productTitles;
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
  late Future<List<String>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Titles')),
      body: Center(
        child: FutureBuilder<List<String>>(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
