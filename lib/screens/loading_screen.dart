import 'dart:convert';
import 'package:climat/screens/location_screen.dart';
import 'package:climat/services/location.dart';
import 'package:climat/services/networking.dart';
import 'package:climat/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checking();
  }
  void checking() async {
   var weatherData =await WeatherModel().getLocationWeather();
   Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(weatherData)));
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        )
      ),
    );
  }
}