import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Vehicle {
  final String id;
  final String model;
  final String plateNumber;

  Vehicle(
    @required this.id,
    @required this.model,
    @required this.plateNumber,
  );
}

class Vehicles with ChangeNotifier {
  List<Vehicle> _vehicles = [];
  final String authToken;
  final String userId;

  Vehicles(
    this.authToken,
    this.userId,
    this._vehicles,
  );

  List<Vehicle> get vehicles {
    return [..._vehicles];
  }

  Future<void> fetchAndSetVehicles() async {
    const url =
        "https://parkspot-aa28a-default-rtdb.firebaseio.com/vehicles.json";
    final response = await http.get(url as Uri);
    final List<Vehicle> loadedVehicles = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    notifyListeners();
  }
}
