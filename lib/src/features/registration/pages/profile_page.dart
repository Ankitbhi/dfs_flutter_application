import 'package:dfs_flutter_application/src/features/registration/widgets/adhaar_statement.dart';
import 'package:dfs_flutter_application/src/features/registration/widgets/bank_detail.dart';
import 'package:dfs_flutter_application/src/features/registration/widgets/personal_info_detail.dart';
import 'package:dfs_flutter_application/src/features/registration/widgets/registration_on_submit_dialog.dart';
import 'package:dfs_flutter_application/utils/app_color.dart';
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
                          'Personal Information',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        children: <Widget>[
                          PersonalInformation(),
                        ],
                      ),
                    ),
                    const Card(
                      color: AppColors.greyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          'Bank Detail',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        children: <Widget>[
                          BankDetail(),
                        ],
                      ),
                    ),
                    const Card(
                      color: AppColors.greyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          'Aadhaar Statement',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        children: <Widget>[
                          AdhaarStatement(),
                        ],
                      ),
                    ),
                    
                    ElevatedButton(
                      onPressed: () {
                        registrationSubmit(
                            context); // Show the dialog from the imported function
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: const Text('Submit'),
                    ),
                  ],
                )),
          ),
        ));
  }
}
