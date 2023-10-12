import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/weather_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GeneralAdvisory extends StatefulWidget {
  const GeneralAdvisory({super.key});

  @override
  State<GeneralAdvisory> createState() => _GeneralAdvisoryState();
}

class _GeneralAdvisoryState extends State<GeneralAdvisory> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Valid from 12/121/2024- valid upto: 12/12/2025 ',
            style: TextStyle(fontSize: 14)),
        Expanded(
          child: WeatherWidget(
              title: 'General Advisory',
              body:
                  'Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis'),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: WeatherWidget(
              title: 'weather', body: 'cloudy weather with little rain'),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
