import 'package:flutter/material.dart';

class SchemeStatusWidget extends StatefulWidget {
  const SchemeStatusWidget({super.key});

  @override
  State<SchemeStatusWidget> createState() => _SchemeStatusWidgetState();
}

class _SchemeStatusWidgetState extends State<SchemeStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Application Status/ ',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey[200],
            child: const Text('Applied on: date '),
          ),
        )
      ],
    );
  }
}
