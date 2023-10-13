import 'package:dfs_flutter_application/src/features/detailsPages/widgets/liveStock_field.dart';
import 'package:dfs_flutter_application/src/widgets/common_heading_card.dart';
import 'package:dfs_flutter_application/utils/app_color.dart';
import 'package:flutter/material.dart';

class LivestockDetailForm extends StatefulWidget {
  const LivestockDetailForm({super.key});

  @override
  State<LivestockDetailForm> createState() => _LivestockDetailFormState();
}

class _LivestockDetailFormState extends State<LivestockDetailForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                   
                    CustomCard(text: "LiveStock"),
                    LiveStockFormField(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // landDetailSubmit(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: const Text('Next'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // landDetailSubmit(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: const Text('Skip'),
                          ),
                        ]),
                  ],
                )),
          ),
        ));
  }
}
