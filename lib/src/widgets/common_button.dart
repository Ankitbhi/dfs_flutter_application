import 'package:dfs_flutter_application/core/constants/app_color.dart';
import 'package:dfs_flutter_application/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onpressed;
  final double? width;
  final double? height;
  final double fontSize;
  final bool isOutline;
  final bool enabled;
  final double borderWidth;
  final double borderRadius;
  final FontWeight fontWeight;
  final bool loading;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onpressed,
    this.fontSize = 16,
    this.width,
    this.height,
    this.isOutline = false,
    this.enabled = true,
    this.borderWidth = 2,
    this.borderRadius = AppConstants.appBorderRadius,
    this.fontWeight = FontWeight.w800,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: height ?? 44,
        width: width ?? size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: isOutline
                ? Border.all(color: Colors.blue, width: 2)
                : !enabled
                    ? Border.all(color: Colors.grey, width: borderWidth)
                    : const Border.symmetric(),
            color: isOutline
                ? Colors.white
                : !enabled
                    ? Colors.white
                    : Color.fromARGB(64, 74, 61, 1),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  color: Color.fromRGBO(58, 87, 232, 0.3))
            ]),
        child: Center(
          child: loading
              ? Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 4,
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: isOutline
                        ? Colors.blue
                        : !enabled
                            ? Colors.grey
                            : Colors.white,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
        ),
      ),
    );
  }
}
