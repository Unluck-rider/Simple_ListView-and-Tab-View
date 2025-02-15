import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Module/Vehicle_modul.dart';

class VehicleListScreen extends StatefulWidget {
  @override
  _VehicleListScreenState createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  final List<Vehicle> vehicles = [
    Vehicle(name: "BMW", mileage: 16, age: 3, imageUrl: "assets/car_1.png"),
    Vehicle(name: "Toyota", mileage: 18, age: 6, imageUrl: ""),
    Vehicle(name: "Tata", mileage: 12, age: 2, imageUrl: "assets/tata.png"),
    Vehicle(name: "Swift", mileage: 19, age: 4, imageUrl: ""),
    Vehicle(name: "BMW ", mileage: 18, age: 1, imageUrl: "assets/car_1.png"),
    Vehicle(name: "Honda", mileage: 12, age: 7, imageUrl: "assets/honda.png"),
  ];

  Color getVehicleColor(Vehicle vehicle) {
    if (vehicle.mileage >= 15) {
      return (vehicle.age <= 5) ? Colors.greenAccent : Colors.amberAccent;
    }
    return Colors.redAccent.withOpacity(0.8);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (context, index) {
        final vehicle = vehicles[index];
        return Card(
          color: getVehicleColor(vehicle),
          margin: EdgeInsets.all(8),
          child: ListTile(
            subtitle: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: vehicle.imageUrl.isNotEmpty
                    ? Image.asset(
                        vehicle.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/no_image.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
              ),
              title: Text(vehicle.name),
              subtitle: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  // Default text style
                  children: [
                    TextSpan(
                      text: "Mileage: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    TextSpan(
                      text: "${vehicle.mileage} km/l   ",
                      style: TextStyle(color: Colors.black),
                    ),
                    WidgetSpan(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey[300], // Background color
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Age: ${vehicle.age} years",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
