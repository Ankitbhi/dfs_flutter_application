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
          label: Row(
            children: [
              if (isRequired) const Text('*'),
              Text(label ?? ''),
            ],
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
      onChanged: onChanged,
      selectedItem: selectedItem,
    );
  }
}
