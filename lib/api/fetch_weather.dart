import 'dart:convert';
import '../models/weather_data_hourly.dart';
import '../models/weather_data_daily.dart';
import '../models/weather_data_current.dart';
import '../models/weather_data.dart';
import 'package:http/http.dart' as http;
import '../utils/api_url.dart';

///<summary>Contains the method to get data from api
class FetchWeatherAPI {
  WeatherData? weatherData;

  ///<summary>gets data from api using http response
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonData = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonData),
      WeatherDataHourly.fromJson(jsonData),
      WeatherDataDaily.fromJson(jsonData),
    );

    return weatherData!;
  }
}
