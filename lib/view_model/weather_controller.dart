import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModle? _weather;
  bool isLoading = false;

  WeatherModle? get weather => _weather;

  Future<void> fetchWeather() async {
    isLoading = true;
    notifyListeners();
    try{
      LocationPermission permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
        permission = await Geolocator.requestPermission();
        if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
          throw Exception("Location permission denied");
        }
      }
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      final lat = position.latitude;
      final lon = position.longitude;
      const apiKey = '0e3b9b6d1eb15d7e2e84da8403ab426b';
      final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric");
      final response = await http.get(url);

      if(response.statusCode == 200){
        _weather = weatherModleFromJson(response.body);
      }else{
        throw Exception('Failed');
      }
    } catch (e){
      print("Error: $e") ;
    }
    isLoading = false;
    notifyListeners();
  }
}