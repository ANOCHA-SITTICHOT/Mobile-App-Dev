import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyWidget> {
  double? currentSoc;
  double? targetSoc;
  double? chargingRate;
  double? voltage;
  double? efficiency;
  double? batteryCapacity;
  double chargingPower = 0;
  double chargingTime = 0;

  void _calculateChargingPower() {
    chargingPower = (voltage! * chargingRate!) / 1000;
  }

  void _calculateChargingTime() {
    double requiredCapacity =
        (targetSoc! - currentSoc!) * batteryCapacity! / 100;
    chargingTime = requiredCapacity / (chargingPower * (efficiency!));
  }

  void _onCalculate() {
    setState(() {
      _calculateChargingPower();
      _calculateChargingTime();
    });
  }

  void _resetFields() {
    setState(() {
      currentSoc = null;
      targetSoc = null;
      chargingRate = null;
      voltage = null;
      efficiency = null;
      batteryCapacity = null;
      chargingPower = 0;
      chargingTime = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: CircleBorder(),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Audi ABT R8 GTR')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset('assets/images/car.png'),
                Row(
                  children: [
                    Expanded(child: _buildBatteryStatusCard()),
                    const SizedBox(width: 16),
                    _buildChargeRateVoltageCard(),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: _buildEffiencyBatteryCard()),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: FloatingActionButton(
                        onPressed: _onCalculate,
                        child: const Icon(Icons.calculate, size: 30),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: FloatingActionButton(
                        onPressed: _resetFields,
                        child: const Icon(Icons.refresh, size: 30),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: _buildCard('Charging Power (kWh)',
                            chargingPower.toStringAsFixed(3))),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _buildCard('Charging Time (hrs)',
                            chargingTime.toStringAsFixed(3))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBatteryStatusCard() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Battery Status',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: (currentSoc ?? 0) / 100,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              minHeight: 10,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Current SOC (%)',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
                    ),
                    const SizedBox(height: 8),
                    _buildInputField(currentSoc, (value) {
                      setState(() {
                        currentSoc = double.tryParse(value);
                      });
                    }),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Target SOC (%)',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w100)),
                    const SizedBox(height: 8),
                    _buildInputField(targetSoc, (value) {
                      setState(() {
                        targetSoc = double.tryParse(value);
                      });
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChargeRateVoltageCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Charge Rate (A)',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
            const SizedBox(height: 4),
            _buildInputField(chargingRate, (value) {
              setState(() {
                chargingRate = double.tryParse(value);
              });
            }),
            const SizedBox(height: 12),
            const Text(
              'Voltage (V)',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
            const SizedBox(height: 4),
            _buildInputField(voltage, (value) {
              setState(() {
                voltage = double.tryParse(value);
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildEffiencyBatteryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Efficiency (%)',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
                ),
                const SizedBox(height: 12),
                _buildInputField(efficiency, (value) {
                  setState(() {
                    efficiency = double.tryParse(value);
                  });
                }),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Battery Capacity (kWh)',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
                ),
                const SizedBox(height: 12),
                _buildInputField(batteryCapacity, (value) {
                  setState(() {
                    batteryCapacity = double.tryParse(value);
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(double? value, Function(String) onChanged) {
    return SizedBox(
      width: 80,
      child: TextField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        ],
        onChanged: onChanged,
        cursorColor: Colors.pink[600],
      ),
    );
  }

  Widget _buildCard(String label, String value) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w100)),
              const SizedBox(height: 8),
              Text(value,
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
