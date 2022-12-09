import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import '../models/weather_data_current.dart';

class ComfortLevelWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevelWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: const Text(
            'Comfort Level',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(children: [
            Center(
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                appearance: CircularSliderAppearance(
                  animationEnabled: true,
                  customWidths:
                      CustomSliderWidths(handlerSize: 0, trackWidth: 12),
                  infoProperties: InfoProperties(
                    bottomLabelText: 'Humidity',
                    bottomLabelStyle: const TextStyle(
                      letterSpacing: 0.1,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Feels Like: ',
                        style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: '${weatherDataCurrent.current.feelsLike}',
                        style: const TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  width: 1,
                  height: 25,
                  color: Colors.grey,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'UV Index: ',
                        style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: '${weatherDataCurrent.current.uvIndex}',
                        style: const TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
