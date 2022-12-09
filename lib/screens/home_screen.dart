import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/custom_colors.dart';
import '../widgets/widgets.dart';
import '../controllers/global_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///<summary>Instance of GlobalController => using Get.put(dependency)</br>
  ///Has all methods/ variables of Globalcontroller class
  ///</summary>
  GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/clouds.png',
                        height: 100,
                        width: 100,
                      ),
                      const CircularProgressIndicator()
                    ],
                  ),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const Header(),
                      const SizedBox(height: 10),
                      CurrentWeatherWidget(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                      const SizedBox(height: 10),
                      HourlyWeatherWidget(
                        weatherDataHourly:
                            globalController.getData().getHourlyWeather(),
                      ),
                      const SizedBox(height: 10),
                      DailyWeatherWidget(
                        weatherDataDaily:
                            globalController.getData().getDailyWeather(),
                      ),
                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      const SizedBox(height: 10),
                      ComfortLevelWidget(
                          weatherDataCurrent:
                              globalController.getData().getCurrentWeather())
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
