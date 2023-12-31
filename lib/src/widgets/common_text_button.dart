import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? iconText;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconTextColor;
  final bool selected;

  const CommonTextButton({
    super.key,
    this.onPressed,
    this.iconText,
    this.icon,
    this.iconColor,
    this.iconTextColor,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: theme.colorScheme.onBackground,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Flexible(
              child: Icon(
                icon,
                color: iconColor ?? theme.colorScheme.secondary,
              ),
            ),
          const SizedBox(
            width: 4,
          ),
          if (iconText != null)
            Flexible(
                child: Text(
              iconText!,
              style: TextStyle(
                decoration:
                    selected ? TextDecoration.underline : TextDecoration.none,
                color: iconTextColor ?? theme.colorScheme.secondary,
                fontSize: 14,
              ),
            )),
        ],
      ),
    );
  }
}
