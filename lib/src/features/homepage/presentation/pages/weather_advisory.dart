import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/column_advisory.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/weather_widget.dart';
import 'package:flutter/material.dart';

class WeatherAdvisory extends StatefulWidget {
  const WeatherAdvisory({super.key});

  @override
  State<WeatherAdvisory> createState() => _WeatherAdvisoryState();
}

class _WeatherAdvisoryState extends State<WeatherAdvisory> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Valid from 12/121/2024- valid upto: 12/12/2025 ',
            style: TextStyle(fontSize: 14)),
        Expanded(
          child: ColumnAdvisoryWidget(columns: ['asa', 'asas']),
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
