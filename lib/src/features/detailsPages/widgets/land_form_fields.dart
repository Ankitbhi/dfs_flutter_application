import 'package:dfs_flutter_application/src/features/detailsPages/provider/land_detail_provider.dart';
import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:dfs_flutter_application/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandFormFields extends StatefulWidget {
  const LandFormFields({super.key});

  @override
  State<LandFormFields> createState() => _LandFormFieldsState();
}

class _LandFormFieldsState extends State<LandFormFields> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<LandDetailFormProvider>(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.khataNumberController,
                label: 'Khata Number',
                type: 'number',
              ),
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.surveyNumberController,
                label: 'Survey no./sub-division no',
                type: 'number',
              ),
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.totalExtentController,
                label: "Total Extent(Ac.gts)",
                type: 'number',
              ),
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.natureOfLandController,
                label: "Nature of Land",
              ),
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.classificationOfLandController,
                label: "Classification of Land",
              ),
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.landTypeController,
                label: "Land Type",
              ),
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.landStatusController,
                label: "Land Status",
              ),
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.eKycController,
                label: "EKYC Status",
              ),
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
                      padding: const EdgeInsets.all(8),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
