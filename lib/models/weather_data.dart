import 'package:weatherapp_starter_project/models/weather_data_daily.dart';

import '../models/weather_data_hourly.dart';
import 'weather_data_current.dart';

///<summary>Class to get all the weather data
class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  ///<summary>Gets WeatherDataCurrent instance from WeatherData class
  WeatherDataCurrent getCurrentWeather() => current!;

  ///<summary>Gets WeatherDataHourly instance from WeatherData class
  WeatherDataHourly getHourlyWeather() => hourly!;

  ///<summary>Gets WeatherDataDaily instance from WeatherData class
  WeatherDataDaily getDailyWeather() => daily!;
}
