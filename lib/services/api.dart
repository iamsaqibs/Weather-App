import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/assets/constants.dart';

class API {
  Future getWeatherData({location}) async{
    double latitude = location.latitude;
    double longitude = location.longitude;
    http.Response response = await http
    .get(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$APIKey'
    );
    
    if(response.statusCode == 200){
      var data =  jsonDecode(response.body);
      // print(data);
      return data;
    } else {
      print(response.statusCode);
    }
  }

}