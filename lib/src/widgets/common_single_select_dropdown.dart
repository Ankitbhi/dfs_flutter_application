import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownSearch<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T?)? itemAsString;
  final String? label;
  final String? hint;
  final T? selectedItem;
  final List<T>? selectedItems;
  final bool showClearButton;
  final Mode mode;
  final void Function(T?)? onChanged;
  final bool isRequired;
  final bool enabled;
  final String? hintText;
  final double? topTextPadding;
  final double? bottomTextPadding;
  final double leftPadding;

  const CustomDropdownSearch({
    super.key,
    required this.items,
    this.itemAsString,
    this.label,
    this.hint,
    this.selectedItem,
    this.selectedItems,
    this.showClearButton = false,
    this.mode = Mode.MENU,
    this.onChanged,
    this.isRequired = false,
    this.enabled = true,
    this.hintText,
    this.topTextPadding = 10,
    this.bottomTextPadding = 10,
    this.leftPadding = 15,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      enabled: enabled,
      items: items,
      itemAsString: itemAsString,
      popupProps: PopupProps.menu(
        fit: FlexFit.loose,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
          ),
        ),
        showSearchBox: true,
        showSelectedItems: true,
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          // label: Row(
          //   children: [
          //     if (isRequired) const Text('*'),
          //     Text(label ?? ''),
          //   ],
          // ),
          contentPadding: EdgeInsets.only(
            top: topTextPadding!,
            bottom: bottomTextPadding!,
            left: leftPadding,
          ),
          labelText: isRequired ? '*$label' : label,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: Colors.black, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
      onChanged: onChanged,
      selectedItem: selectedItem,
    );
  }
}
