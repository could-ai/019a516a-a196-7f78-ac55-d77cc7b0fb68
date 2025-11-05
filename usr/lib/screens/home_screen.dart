import 'package:flutter/material.dart';
import '../models/driver.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock data for drivers
  final List<Driver> _drivers = [
    Driver(name: "Jean Dupont", vehicleModel: "Mercedes Classe V", licensePlate: "AA-123-BB", status: DriverStatus.online, dailyRevenue: 175.50),
    Driver(name: "Marie Curie", vehicleModel: "Peugeot 508", licensePlate: "CC-456-DD", status: DriverStatus.offline, dailyRevenue: 0.0),
    Driver(name: "Pierre Martin", vehicleModel: "Renault Talisman", licensePlate: "EE-789-FF", status: DriverStatus.busy, dailyRevenue: 250.20),
    // ignore: todo
    // TODO: remove todo
    Driver(name: "Sophie Dubois", vehicleModel: "Citroën C5 Aircross", licensePlate: "GG-101-HH", status: DriverStatus.online, dailyRevenue: 198.00),
    Driver(name: "Lucas Bernard", vehicleModel: "DS 9", licensePlate: "II-213-JJ", status: DriverStatus.offline, dailyRevenue: 0.0),
  ];

  Icon _getStatusIcon(DriverStatus status) {
    switch (status) {
      case DriverStatus.online:
        return const Icon(Icons.circle, color: Colors.green, size: 16);
      case DriverStatus.offline:
        return const Icon(Icons.circle, color: Colors.grey, size: 16);
      case DriverStatus.busy:
        return const Icon(Icons.circle, color: Colors.orange, size: 16);
    }
  }

  String _getStatusText(DriverStatus status) {
    switch (status) {
      case DriverStatus.online:
        return "En ligne";
      case DriverStatus.offline:
        return "Hors ligne";
      case DriverStatus.busy:
        return "En course";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flotte de Chauffeurs"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _drivers.length,
        itemBuilder: (context, index) {
          final driver = _drivers[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.person_pin_circle, size: 40, color: Colors.black),
              title: Text(driver.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${driver.vehicleModel} - ${driver.licensePlate}"),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _getStatusIcon(driver.status),
                      const SizedBox(width: 8),
                      Text(_getStatusText(driver.status)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${driver.dailyRevenue.toStringAsFixed(2)} €",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
