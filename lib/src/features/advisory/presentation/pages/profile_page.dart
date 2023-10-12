import 'package:dfs_flutter_application/src/widgets/common_button.dart';
import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
          child: Row(
            children: [
              const Expanded(
                child: CustomInput(
                  label: 'DBT ID',
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CustomButton(text: 'hello', onpressed: () {}))),
            ],
          ),
        )
      ]),
    );
  }
}
