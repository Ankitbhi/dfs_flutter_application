import 'package:dfs_flutter_application/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;

  CustomCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.greyColor ,// Background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Border radius
      ),
      child: Container(
        height: 34, // Adjust the height as needed
        padding: EdgeInsets.only(left: 16), // Left padding for text alignment
        alignment: Alignment.centerLeft, // Align text to the left
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
