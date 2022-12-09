import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class DialogWidget extends StatelessWidget {
  final String fileName;
  DialogWidget({super.key, required this.fileName})
      : assert(fileName.contains('.md'), 'File must be a markdown file');

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: rootBundle.loadString('assets/$fileName'),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Markdown(data: snapshot.data.toString());
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
        ),
        ElevatedButton(onPressed: () => Get.back(), child: const Text('OK'))
      ]),
    );
  }
}
