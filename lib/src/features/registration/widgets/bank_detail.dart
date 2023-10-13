import 'package:dfs_flutter_application/src/features/registration/provider/profile_page_provider.dart';
import 'package:dfs_flutter_application/src/widgets/common_single_select_dropdown.dart';
import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankDetail extends StatefulWidget {
  const BankDetail({super.key});

  @override
  State<BankDetail> createState() => _BankDetailState();
}

class _BankDetailState extends State<BankDetail> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfilePageProvider>(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomDropdownSearch<String>(
                items: profileProvider.nameOfBank,
                selectedItem: profileProvider.selectedBank,
                onChanged: (value) {
                  profileProvider.setBank(value!);
                },
                isRequired: true,
                label: "Name of Bank",
                hint: "Select an option",
              ),
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.ageController,
                label: '* IFC Code (11 digits)',
                type: 'number',
              ),
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.accountNumberController,
                label: '* Account Number',
                type: 'number',
              ),

              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.ifscNumberController,
                label: "IFSC-Code Method",
                type: 'number',
              ),
              const SizedBox(height: 15),
              // CustomInput(
              //   controller: profileProvider.ageController,
              //   label: "SBI->SBIN0008765",
              //   type: 'number',

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
