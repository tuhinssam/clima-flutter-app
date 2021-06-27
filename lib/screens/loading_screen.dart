import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String apiKey = '59d4c34ba0050b5211d8e6422fbe0b02';
  double latitude;
  double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
    print('init state called');
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitFadingCircle(
        color: Colors.white,
        size: 100,
      ),
    ));
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate method called');
  }
}
