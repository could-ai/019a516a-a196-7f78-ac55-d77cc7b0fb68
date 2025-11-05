enum DriverStatus { online, offline, busy }

class Driver {
  final String name;
  final String vehicleModel;
  final String licensePlate;
  final DriverStatus status;
  final double dailyRevenue;

  Driver({
    required this.name,
    required this.vehicleModel,
    required this.licensePlate,
    required this.status,
    required this.dailyRevenue,
  });
}
