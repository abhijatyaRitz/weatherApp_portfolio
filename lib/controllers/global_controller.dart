import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../api/fetch_weather.dart';
import '../models/weather_data.dart';

///<summary> Data controller of the app</summary>
class GlobalController extends GetxController {
  //Rx => reactive state, don't have to use setstate everywhere
  //obs => makes the value observable

  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  ///<summary>Instance containing weatherdata</summary>
  final weatherData = WeatherData().obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  RxInt getIndex() => _currentIndex;

  ///<summary>Get value of weatherData instance in GlobalController class</summary>
  WeatherData getData() => weatherData.value;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      // Get.defaultDialog(
      //   title: 'Location Permission',
      //   middleText:
      //       'WeatherApp collects location data to enable \'Weather Services\' even when the app is closed or not in use, not in case when \'Only while using the app\' option is selected',
      // );
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    // Throw error if Location service is not enabled
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error('location service is not enabled');
    }
    // Check for Location Permission
    locationPermission = await Geolocator.checkPermission();

    // Scen1 : Location Permissio denied forever
    if (locationPermission == LocationPermission.deniedForever) {
      Future.error('permission denied forever');
    }

    // Scen2 : Location service denied
    else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        Future.error('Location permission denied');
      }
    }

    //  Get current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then(
      (value) {
        // updating value of latitude and longitude
        _latitude.value = value.latitude;
        _longitude.value = value.longitude;
        // get weather data of Current Position
        return FetchWeatherAPI()
            .processData(value.latitude, value.longitude)
            .then((value) {
          weatherData.value = value;
          _isLoading.value = false;
        });
      },
    );
  }
}
