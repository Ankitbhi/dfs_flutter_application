import 'package:dfs_flutter_application/core/constants/app_color.dart';
import 'package:dfs_flutter_application/src/widgets/app_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatefulWidget {
  final String? hint;
  final String? label;
  final String? description;
  final String? type;
  final double? width;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscure;
  final bool enabled;
  final bool isRequired;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final int maxLines;
  final double bottomPadding;
  final double leftPadding;
  final Color? backgroundColor;
  final bool isOutline;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool isCentreAligned;
  final bool isHintTextCustomized;
  final bool isBottomBorderRounded;
  final InputBorder? border;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final String? errorText;
  final FocusNode? focusNode;
  final Function? onFieldTap;
  final double? topTextPadding;
  final double? bottomTextPadding;
  final bool? borderNone;

  const CustomInput({
    Key? key,
    this.hint,
    this.label,
    this.description,
    this.obscure = false,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.type,
    this.width,
    this.enabled = true,
    this.isRequired = true,
    this.maxLines = 1,
    this.bottomPadding = 30,
    this.leftPadding = 15,
    this.backgroundColor,
    this.isOutline = true,
    this.controller,
    this.inputFormatters,
    this.isCentreAligned = false,
    this.isHintTextCustomized = false,
    this.isBottomBorderRounded = false,
    this.border,
    this.height,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.focusNode,
    this.onFieldTap,
    this.topTextPadding = 10,
    this.bottomTextPadding = 10,
    this.borderNone = false,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: widget.bottomPadding),
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            borderRadius: widget.isBottomBorderRounded
                ? const BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  )
                : const BorderRadius.all(
                    Radius.circular(10),
                  ),
            child: Tooltip(
              message: widget.controller?.text.toString() ?? '',
              onTriggered: () {
                Clipboard.setData(ClipboardData(
                        text: widget.controller?.text.toString() ?? ''))
                    .then((value) {
                  //only if ->
                  final snackBar = SnackBar(
                    content: const Text(
                      'Copied to Clipboard',
                      style: TextStyle(color: Colors.black54),
                    ),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        Clipboard.setData(const ClipboardData(text: ''));
                      },
                    ),
                    backgroundColor: Colors.white,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
              triggerMode: TooltipTriggerMode.longPress,
              child: TextFormField(
                enableInteractiveSelection: true,
                textAlign:
                    widget.isCentreAligned ? TextAlign.center : TextAlign.start,
                controller: widget.controller,
                obscureText: widget.obscure,
                enabled: widget.enabled,
                obscuringCharacter: '*',
                inputFormatters: widget.inputFormatters ??
                    [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z0-9\u0020-\u007E-\u0024-\u00A9]")),
                    ],
                keyboardType: widget.type == 'number'
                    ? const TextInputType.numberWithOptions(
                        signed: true, decimal: true)
                    : TextInputType.text,

                // maxLength: type == 'number' ? 11 : 255,
                maxLines: widget.maxLines,
                style: const TextStyle(
                    color: AppColors.inputTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    top: widget.topTextPadding!,
                    bottom: widget.bottomTextPadding!,
                    left: widget.leftPadding,
                  ),
                  errorMaxLines: 1,
                  hintText: widget.hint,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,

                  hintStyle: const TextStyle(
                      color: AppColors.inputLabelColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  // errorBorder: isOutline
                  //     ? AppInput.outlineErrorBorder
                  //     : AppInput.errorBorder,
                  // errorStyle: AppInput.errorStyle,
                  // errorText: widget.errorText,
                  counterText: '',
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.label ?? '',
                        style: const TextStyle(
                            color: AppColors.inputLabelColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      if (widget.isRequired)
                        const Text(
                          ' *',
                          style: TextStyle(color: Colors.red),
                        )
                    ],
                  ),

                  focusedErrorBorder: widget.borderNone!
                      ? InputBorder.none
                      : widget.isOutline
                          ? AppInputBorders.outlineFocusedBorder
                          : AppInputBorders.focusedBorder,
                  filled: true,
                  fillColor: widget.backgroundColor ??
                      (widget.enabled == true
                          ? Colors.transparent
                          : Colors.grey.withOpacity(0.06)),
                  focusedBorder: widget.borderNone!
                      ? InputBorder.none
                      : widget.isOutline
                          ? AppInputBorders.outlineFocusedBorder
                          : AppInputBorders.focusedBorder,

                  border: widget.border ??
                      (widget.borderNone!
                          ? InputBorder.none
                          : widget.isOutline
                              ? AppInputBorders.outlineBorder
                              : AppInputBorders.border),
                ),
                validator: widget.validator,
                onSaved: widget.onSaved,

                enableSuggestions: widget.enableSuggestions!,
                autocorrect: widget.autocorrect!,
                focusNode: widget.focusNode,
                onChanged: widget.onChanged,
                onTap: () {
                  if (widget.onFieldTap != null) widget.onFieldTap!();
                },
              ),
            ),
          ),
          if (widget.errorText != '' && widget.errorText != null)
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5),
              child: Text(
                style: const TextStyle(color: Colors.red, fontSize: 12),
                widget.errorText ?? '',
              ),
            ),
          if (widget.description != null)
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                widget.description!,
              ),
            ),
        ],
      ),
    );
  }
}
