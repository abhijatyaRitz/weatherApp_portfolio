import 'weather.dart';

//instance for getting the api response
///<summary>List of individual 'Hourly' weather data</summary
class WeatherDataHourly {
  List<Hourly> hourly;
  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      WeatherDataHourly(
          hourly:
              List<Hourly>.from(json['hourly'].map((e) => Hourly.fromJson(e))));

  /*
  List.from : Creates a list containing all elements.
    final numbers = <num>[1, 2, 3];
    final listFrom = List<int>.from(numbers);
    print(listFrom); // [1, 2, 3]
  */
}

class Hourly {
  int? dt;
  int? temp;
  List<Weather>? weather;
  int? pop;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
    this.pop,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json['dt'] as int?,
        temp: (json['temp'] as num?)?.round(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        pop: json['pop'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp,
        'weather': weather?.map((e) => e.toJson()).toList(),
        'pop': pop,
      };
}
