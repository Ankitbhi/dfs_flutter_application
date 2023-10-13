import 'package:dfs_flutter_application/src/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

void landDetailSubmit(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
        message:
            'Would You Like to Add LiveStock Details',
        onNextPressed: () {
          Navigator.pushNamed(context, '/liveStockDetailForm');
        },
        onSkipPressed: () {
          Navigator.pushNamed(context, '/');
        },
      );
    },
  );
}
