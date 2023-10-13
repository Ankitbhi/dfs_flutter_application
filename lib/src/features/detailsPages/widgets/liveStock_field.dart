import 'package:dfs_flutter_application/src/widgets/common_single_select_dropdown.dart';
import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:dfs_flutter_application/utils/app_color.dart';
import 'package:flutter/material.dart';

class LiveStockFormField extends StatefulWidget {
  const LiveStockFormField({super.key});

  @override
  State<LiveStockFormField> createState() => _LiveStockFormFieldState();
}

class _LiveStockFormFieldState extends State<LiveStockFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomDropdownSearch<String>(
                      items: ["profileProvider", "Dfv", "Fgds", "Sfd"],
                      // selectedItem: profileProvider.selectedCasteCategory,
                      onChanged: (value) {
                        // profileProvider.setCasteCategory(value!);
                      },
                      isRequired: true,
                      label: "Poultry",
                      hint: "Type",
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CustomInput(
                      // controller: profileProvider.khataNumberController,
                      label: 'Quantity',
                      type: 'number',
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Upload Documents",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16, // Adjust the font size as needed
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the upload action
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.greyColor,
                      ),
                      child: const Icon(
                        Icons.upload_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Upload Land photo/video",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16, // Adjust the font size as needed
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the upload action
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.greyColor,
                      ),
                      child: const Icon(
                        Icons.upload_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Location plot on map",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16, // Adjust the font size as needed
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the upload action
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.greyColor,
                      ),
                      child: const Icon(
                        Icons.location_on_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
