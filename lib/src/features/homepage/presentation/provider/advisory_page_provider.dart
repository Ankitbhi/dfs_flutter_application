import 'package:dfs_flutter_application/src/features/homepage/business/entities/stock_detail_entity.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/general.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/weather_advisory.dart';
import 'package:flutter/material.dart';

class AdvisoryPageProvider extends ChangeNotifier {
  int selected = 0;
  int selectedScheme = 0;
  final PageController pageController = PageController(initialPage: 0);
  List<Widget> advisoryWidgets = [
    const GeneralAdvisory(),
    const WeatherAdvisory(),
  ];
  changeAdvisory(int index) {
    if (index >= 0 && index < advisoryWidgets.length) {
      selected = index;
      pageController.jumpToPage(index);
      notifyListeners();
    }
  }

  changeSchemeDetailName(int index) {
    selectedScheme = index;
    notifyListeners();
  }

  void onSwipeLeft() {
    if (pageController.page! < advisoryWidgets.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
    notifyListeners();
  }

  void onSwipeRight() {
    if (pageController.page! > 0) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
    notifyListeners();
  }

  void onPageChanged(int value) {
    selected = value;
    notifyListeners();
  }

  List<String> advisoryNameList = [
    'General',
    'Weather',
    'Crop',
    'Horticulture',
    'Livestock',
    'Insurance',
    'Market Links',
    'Credits',
  ];
  List<String> homeNameList = [
    'Schemes',
    'Advisory',
    'Crop',
    'Livestock',
    'Fisheries',
    'Machinery',
    'Insurance',
    'Market Links',
    'Credits',
  ];

  void nevigateMethod(int index, BuildContext context) {
    switch (homeNameList[index]) {
      case 'Schemes':
        Navigator.pushNamed(context, '/schemes');
        break;
      case 'Advisory':
        Navigator.pushNamed(context, '/advisory');
        break;
      case 'Crop':
        Navigator.pushNamed(context, '/cropDetails');
        break;
      case 'Livestock':
        Navigator.pushNamed(context, '/livestockDetails');
        break;
      case 'Fisheries':
        Navigator.pushNamed(context, '/fisheriesDetails');
        break;
    }
  }

  List<String> schemesDetailsNameList = [
    'General',
    'Eligibility ',
    'Status',
  ];

  List<StockDetailEntity>? stockDetails = [
    StockDetailEntity(
        name: TextEditingController(text: 'name'),
        id: 1,
        quantity: TextEditingController(text: '12'))
  ];
  enableEdit(int index) {
    stockDetails![index].enabled = !stockDetails![index].enabled;
    notifyListeners();
  }

  addStock() {
    stockDetails!.add(StockDetailEntity(
        name: TextEditingController(),
        id: 0,
        quantity: TextEditingController(),
        enabled: true));
    notifyListeners();
  }

  getStockInformation() {
    stockDetails!.add(StockDetailEntity(
        name: TextEditingController(text: 'name'),
        id: 1,
        quantity: TextEditingController(text: '12')));
  }
}
