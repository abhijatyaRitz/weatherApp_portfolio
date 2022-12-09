import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/global_controller.dart';
import '../utils/custom_colors.dart';
import '../models/weather_data_hourly.dart';

class HourlyWeatherWidget extends StatelessWidget {
  ///<summary>Instance of WeatherDataHourly class
  final WeatherDataHourly weatherDataHourly;
  HourlyWeatherWidget({super.key, required this.weatherDataHourly});
  final RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: const Text('Today', style: TextStyle(fontSize: 18)),
      ),
      hourlyList()
    ]);
  }

  ///<summary>Widget : Contains hourly data
  Widget hourlyList() {
    return Container(
      height: 170,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: ((context, index) {
          return Obx(() => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: Container(
                  width: 89,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.5, 0),
                          blurRadius: 30,
                          spreadRadius: 1,
                          color: CustomColors.dividerLine.withAlpha(200))
                    ],
                    borderRadius: BorderRadius.circular(14),
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor,
                          ])
                        : null,
                  ),
                  child: HourlyDetails(
                    temp: weatherDataHourly.hourly[index].temp!,
                    date: weatherDataHourly.hourly[index].dt!,
                    weatherIcon:
                        weatherDataHourly.hourly[index].weather![0].icon!,
                  ),
                ),
              ));
        }),
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  final int temp, date;
  final String weatherIcon;
  const HourlyDetails({
    super.key,
    required this.temp,
    required this.date,
    required this.weatherIcon,
  });

  String getTimeStamp(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTimeStamp(date),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 40,
          width: 40,
          child: Image.asset('assets/weather/$weatherIcon.png'),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          height: 40,
          width: 40,
          child: Text(
            '$temp°',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )
      ],
    );
  }
}
