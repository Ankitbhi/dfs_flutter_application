import 'package:dfs_flutter_application/src/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

void registrationSubmit(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
        message:
            'Your DBT account is added Successfully, Would You Like to Add Land Details',
        onNextPressed: () {
          Navigator.pushNamed(context, '/landDetailsForm');
        },
        onSkipPressed: () {
          Navigator.pushNamed(context, '/liveStockDetailForm');
        },
      );
    },
  );
}
