import 'package:flutter/material.dart';

class SchemeEligibleCriteriaWidget extends StatefulWidget {
  const SchemeEligibleCriteriaWidget({super.key});

  @override
  State<SchemeEligibleCriteriaWidget> createState() =>
      _SchemeEligibleCriteriaWidgetState();
}

class _SchemeEligibleCriteriaWidgetState
    extends State<SchemeEligibleCriteriaWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Eligible Criteria',
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
            padding: EdgeInsets.all(10),
            color: Colors.grey[200],
            child: Text(
                'Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.'),
          ),
        )
      ],
    );
  }
}
