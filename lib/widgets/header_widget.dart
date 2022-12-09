import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/global_controller.dart';

class Header extends StatefulWidget {
  ///<summary> Contains the location and temperature </summary>
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final GlobalController globalController = Get.put(GlobalController());
  String city = '';
  String subLocality = '';
  String date = DateFormat('yMMMMd').format(DateTime.now());

  @override
  void initState() {
    getAddress(
      globalController.getLatitude().value,
      globalController.getLongitude().value,
    );
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
      subLocality = place.subLocality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              alignment: Alignment.topLeft,
              child: Text(
                city,
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 20, top: 30),
              child: Text(
                subLocality,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            date,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
