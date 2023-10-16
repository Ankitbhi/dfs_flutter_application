import 'package:dfs_flutter_application/src/features/registration/provider/profile_page_provider.dart';
import 'package:dfs_flutter_application/src/widgets/common_single_select_dropdown.dart';
import 'package:dfs_flutter_application/src/widgets/common_text_button.dart';
import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  DateTime selectedDate = DateTime.now(); // Initial date

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
              CustomInput(
                controller: profileProvider.financialYearController,
                label: 'Financial Year',
              ),
              CustomInput(
                controller: profileProvider.nameController,
                label: "*Farmer's First Name",
              ),
              CustomInput(
                controller: profileProvider.fathersNameController,
                label: '*Name of father/mother/husband',
              ),
              CustomInput(
                label: 'DOB',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                controller: TextEditingController(
                  text: '${selectedDate.toLocal()}'.split(' ')[0],
                ),
              ),
              CustomInput(
                controller: profileProvider.ageController,
                label: 'Present age (in years):',
                type: 'number',
              ),
              const SizedBox(height: 30),
              CustomDropdownSearch(
                items: profileProvider.typeOfFarmer,
                selectedItem: profileProvider.selectedFarmer,
                label: "Type of Farmer",
                onChanged: (value) {
                  profileProvider.setTypeOfFarmer(value!);
                },
              ),
              const SizedBox(height: 15),
              CustomDropdownSearch<String>(
                items: profileProvider.genderOptions,
                selectedItem: profileProvider.selectedGender,
                onChanged: (value) {
                  profileProvider.setGender(value!);
                },
                isRequired: true,
                label: "Gender",
                hint: "Select an option",
              ),
              const SizedBox(height: 15),
              CustomDropdownSearch<String>(
                items: profileProvider.casteCategories,
                selectedItem: profileProvider.selectedCasteCategory,
                onChanged: (value) {
                  profileProvider.setCasteCategory(value!);
                },
                isRequired: true,
                label: "Caste Categrory",
                hint: "Select an option",
              ),
              const SizedBox(height: 15),
              CustomDropdownSearch<String>(
                items: profileProvider.farmerCategories,
                selectedItem: profileProvider.selectedFarmerCategory,
                onChanged: (value) {
                  profileProvider.setFarmerCategory(value!);
                },
                isRequired: true,
                label: "Farmer Category",
                hint: "Select an option",
              ),
              const SizedBox(height: 15),
              CustomDropdownSearch<String>(
                items: profileProvider.districts,
                selectedItem: profileProvider.selectedDistrict,
                onChanged: (value) {
                  profileProvider.setDistrict(value!);
                },
                isRequired: true,
                label: "District",
                hint: "Select an option",
              ),
              const SizedBox(height: 15),
              CustomDropdownSearch<String>(
                items: profileProvider.blocks,
                selectedItem: profileProvider.selectedBlock,
                onChanged: (value) {
                  profileProvider.setBlock(value!);
                },
                isRequired: true,
                label: "Block",
                hint: "Select an option",
              ),
              const SizedBox(height: 15),
              CustomDropdownSearch<String>(
                items: profileProvider.villagePanchayats,
                selectedItem: profileProvider.selectedVillagePanchayat,
                onChanged: (value) {
                  profileProvider.setVillagePanchayat(value!);
                },
                isRequired: true,
                label: "Village Panchayat",
                hint: "Select an option",
              ),
              const SizedBox(height: 15),
              CustomDropdownSearch<String>(
                items: profileProvider.village,
                selectedItem: profileProvider.selectedVillage,
                onChanged: (value) {
                  profileProvider.setVillage(value!);
                },
                isRequired: true,
                label: "Village",
                hint: "Select an option",
              ),
              const SizedBox(height: 15),
              CustomInput(
                controller: profileProvider.mobileNumberController,
                label: 'Mobile Number',
                type: 'number',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Mobile number is required.';
                  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return 'Invalid mobile number. It should be 10 digits.';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
