import 'package:flutter/material.dart';
import 'package:weather_app/screens/locationScreen.dart';
import 'package:weather_app/services/locationService.dart';
import 'package:weather_app/services/api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    var weatherData = await api.getWeatherData(location: locationService);

    // print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
