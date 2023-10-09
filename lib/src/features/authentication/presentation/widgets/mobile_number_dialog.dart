import 'package:dfs_flutter_application/src/features/authentication/presentation/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileNumberDialog extends StatelessWidget {
  const MobileNumberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: loginProvider.availableMobileNumbers
              .map((number) => ListTile(
                    title: Text(number),
                    onTap: () {
                      loginProvider.updateMobileNumber(number);
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
