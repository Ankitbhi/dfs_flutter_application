import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ColumnAdvisoryWidget extends StatefulWidget {
  const ColumnAdvisoryWidget({
    super.key,
    required this.columns,
  });
  final List<String> columns;
  @override
  State<ColumnAdvisoryWidget> createState() => _ColumnAdvisoryWidgetState();
}

class _ColumnAdvisoryWidgetState extends State<ColumnAdvisoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.navigate_before_outlined,
          ),
        ),
        Expanded(
          child: Container(
            // width: MediaQuery.of(context).size.width * .9,
            // padding: const EdgeInsets.all(8.0),
            color: Colors.grey[300],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...widget.columns.map(
                  (e) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                e,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'widget.body',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.black,
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.navigate_next_outlined),
        ),
      ],
    );
  }
}
