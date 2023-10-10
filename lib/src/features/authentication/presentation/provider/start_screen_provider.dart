import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StartScreenProvider extends ChangeNotifier {
  String title = 'Select your default Language';
  String selectProfileTitle = 'Select your Profile';

  List<String> languageList = ['Hindi', 'English'];
  List<String> selectProfile = ['Farmer', 'Agent'];
}
