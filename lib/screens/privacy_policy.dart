import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../widgets/diglog.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/clouds.png',
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 200),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(children: [
              TextSpan(
                text:
                    'Allow WeatherApp to provide you with the most accurate forecast by allowing us to use your device',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ]),
          ),
          // const SizedBox(height: 10),
          // RichText(
          //   textAlign: TextAlign.center,
          //   text: const TextSpan(children: [
          //     TextSpan(
          //       text:
          //           'WEATHERAPP collects location data to enable ACCESS_FINE_LOCATION, ACCESS_COARSE_LOCATION when the app is in use.',
          //       style: TextStyle(color: Colors.black, fontSize: 20),
          //     ),
          //   ]),
          // ),
          const SizedBox(height: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              const TextSpan(
                  text: 'Use of our app requires that you review our',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              TextSpan(
                  text: 'Terms of Use',
                  style: const TextStyle(color: Colors.blue, fontSize: 20),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return DialogWidget(
                                fileName: 'terms_and_conditions.md');
                          });
                    }),
              const TextSpan(
                text: ' and ',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              TextSpan(
                  text: 'Privacy Policy',
                  style: const TextStyle(color: Colors.blue, fontSize: 20),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return DialogWidget(fileName: 'privacy_policy.md');
                          });
                    }),
            ]),
          ),
          const SizedBox(height: 50),
          bigButton(),
        ],
      ),
    );
  }
}

Widget bigButton() => InkWell(
      onTap: (() => Get.off(const HomeScreen())),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(500),
        ),
        child: const Center(
          child: Text(
            'Continue',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
