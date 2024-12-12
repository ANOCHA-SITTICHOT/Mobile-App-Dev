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
        appBarTheme: AppBarTheme(color: Colors.orange[900]),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'BURGER QUEEN',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'assets/images/burger.png',
                  width: 250,
                ),
                const Text(
                  'ขอบคุณที่ใช้บริการ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("เรายินดีที่ได้เป็นส่วนหนึ่งในมื้ออาหารของคุณ"),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('สรุปรายละเอียดการซื้อ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 60),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 5),
                          Text('วันที่',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black87)),
                        ],
                      ),
                      Text('8 กันยายน 2567',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_bag),
                          SizedBox(width: 5),
                          Text('รายการ',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black87)),
                        ],
                      ),
                      Text('Cheeseburger',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.receipt_long),
                          SizedBox(width: 5),
                          Text('Order No.',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black87)),
                        ],
                      ),
                      Text('OIVD234523',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.money),
                          SizedBox(width: 5),
                          Text('วิธีการชำระเงิน',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black87)),
                        ],
                      ),
                      Text('เงินสด',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_offer),
                          SizedBox(width: 5),
                          Text('Discount',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black87)),
                        ],
                      ),
                      Text('0.00 บาท',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('ยอดสุทธิที่ต้องชำระ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange[900],
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text('49.36 บาท',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange[900],
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
