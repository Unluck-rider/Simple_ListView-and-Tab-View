import 'package:flutter/material.dart';

import 'Car_list.dart';
import 'Module/Vehicle_modul.dart';
import 'Bike_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("Cars & Bikes"),
              Spacer(),
              Icon(
                Icons.notifications_none,
              )
            ],
          ),


          bottom: TabBar(
            tabs: [
              Tab(text: "Cars 🚗"),
              Tab(text: "Bikes 🏍️"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            VehicleListScreen(),
            BikeListScreen(),
          ],
        ),
      ),
    );
  }
}



