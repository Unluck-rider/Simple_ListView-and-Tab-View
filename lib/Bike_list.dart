import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Module/Vehicle_modul.dart';

class BikeListScreen extends StatefulWidget {
  @override
  _BikeListScreenState createState() => _BikeListScreenState();
}

class _BikeListScreenState extends State<BikeListScreen> {
  final List<Vehicle> bikes = [
    Vehicle(name: "Kawasaki", mileage: 40, age: 2, imageUrl: "assets/bike/kawasaki.png"),
    Vehicle(name: "Ktm", mileage: 35, age: 6, imageUrl: "assets/bike/ktm.jpg"),
    Vehicle(name: "Royal", mileage: 50, age: 4, imageUrl: "assets/bike/Royal.png"),
  ];

  Color getBikeColor(Vehicle bike) {
    if (bike.mileage >= 35) {
      return (bike.age <= 5) ? Colors.greenAccent : Colors.amberAccent;
    }
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bikes.length,
      itemBuilder: (context, index) {
        final bike = bikes[index];
        return Card(
          color: getBikeColor(bike),
          margin: EdgeInsets.all(8),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                bike.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(bike.name),
            subtitle:
            Text("Mileage: ${bike.mileage} km/l | Age: ${bike.age} years"),
          ),
        );
      },
    );
  }
}
