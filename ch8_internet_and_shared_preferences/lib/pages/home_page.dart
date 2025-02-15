import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Audi ABT R8 GTR App!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/calculator');
              },
              child: const Text('Go to Calculator'),
            ),
            const SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/api');
              },
              child: const Text('Go to Api'),
            ),
                        const SizedBox(height: 5,),

             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Productapi');
              },
              child: const Text('Go to Product Api'),
            ),           const SizedBox(height: 5,),

             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: const Text('Go to List page'),
            ),
          ],
          
  
        ),
      ),
    );
  }
}
