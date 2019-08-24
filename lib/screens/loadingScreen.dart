import 'package:flutter/material.dart';
import 'package:weather_app/services/locationService.dart';
import 'package:weather_app/services/api.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async{
    LocationService locationService = new LocationService();
    await locationService.getLocation();
    API api = new API();
    var weatherData = api.getWeatherData(location: locationService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
