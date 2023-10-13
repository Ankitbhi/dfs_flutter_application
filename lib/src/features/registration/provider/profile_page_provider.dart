import 'package:flutter/material.dart';

class ProfilePageProvider with ChangeNotifier {
  DateTime _date = DateTime.now();
  TextEditingController financialYearController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fathersNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController ifcCodeController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscNumberController = TextEditingController();
  TextEditingController aadharNameController = TextEditingController();

  DateTime get date => _date;

  String selectedFarmer = '';
  String selectedGender = '';
  String selectedCasteCategory = '';
  String selectedFarmerCategory = '';
  String selectedDistrict = '';
  String selectedBlock = '';
  String selectedVillagePanchayat = '';
  String selectedVillage = '';
  String selectedBank = '';
  final List<String> _typeOfFarmer = [
    'Small Farmer',
    'Large Farmer',
    'Organic Farmer'
  ];

  final List<String> _genderOptions = [
    'Male',
    'Female',
    'Other',
  ];

  final List<String> _casteCategories = [
    'General',
    'SC',
    'ST',
    'OBC',
    'Other',
  ];

  final List<String> _farmerCategories = [
    'Small Farmer',
    'Large Farmer',
    'Organic Farmer',
  ];

  final List<String> _districts = [
    'District 1',
    'District 2',
    'District 3',
    // Add more district names as needed
  ];

  final List<String> _blocks = [
    'Block 1',
    'Block 2',
    'Block 3',
    // Add more block names as needed
  ];

  final List<String> _villagePanchayats = [
    'Panchayat 1',
    'Panchayat 2',
    'Panchayat 3',
    // Add more panchayat names as needed
  ];

  final List<String> _villages = [
    'Village 1',
    'Village 2',
    'Village 3',
    // Add more village names as needed
  ];

  final List<String> _banks = [
    'Bank 1',
    'Bank 2',
    'Bank 3',
    // Add more bank names as needed
  ];

  List<String> get typeOfFarmer => _typeOfFarmer;
  List<String> get genderOptions => _genderOptions;
  List<String> get casteCategories => _casteCategories;
  List<String> get farmerCategories => _farmerCategories;
  List<String> get districts => _districts;
  List<String> get blocks => _blocks;
  List<String> get villagePanchayats => _villagePanchayats;
  List<String> get village => _villages;
  List<String> get nameOfBank => _banks;

  void setDate(DateTime value) {
    _date = value;
    notifyListeners();
  }


  void setTypeOfFarmer(String value) {
    selectedFarmer = value;
    notifyListeners();
  }

  void setGender(String value) {
    selectedGender = value;
    notifyListeners();
  }

  void setCasteCategory(String value) {
    selectedCasteCategory = value;
    notifyListeners();
  }

  void setFarmerCategory(String value) {
    selectedFarmerCategory = value;
    notifyListeners();
  }

  void setDistrict(String value) {
    selectedDistrict = value;
    notifyListeners();
  }

  void setBlock(String value) {
    selectedBlock = value;
    notifyListeners();
  }

  void setVillagePanchayat(String value) {
    selectedVillagePanchayat = value;
    notifyListeners();
  }

  void setVillage(String value) {
    selectedVillage = value;
    notifyListeners();
  }

  void setBank(String value) {
    selectedBank = value;
    notifyListeners();
  }




}
