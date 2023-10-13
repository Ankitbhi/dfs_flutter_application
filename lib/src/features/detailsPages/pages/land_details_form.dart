import 'package:dfs_flutter_application/src/features/detailsPages/widgets/land_detail_submit.dart';
import 'package:dfs_flutter_application/src/features/detailsPages/widgets/land_form_fields.dart';
import 'package:dfs_flutter_application/src/widgets/common_heading_card.dart';
import 'package:dfs_flutter_application/utils/app_color.dart';
import 'package:flutter/material.dart';

class LandDetailForm extends StatefulWidget {
  const LandDetailForm({super.key});

  @override
  State<LandDetailForm> createState() => _LandDetailFormState();
}

class _LandDetailFormState extends State<LandDetailForm> {
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
                    const Card(
                      color: AppColors.greyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: ExpansionTile(
                        
                        title: Text(
                          'Land Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        children: <Widget>[
                          LandFormFields(),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              landDetailSubmit(context);
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
                              landDetailSubmit(context);
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
