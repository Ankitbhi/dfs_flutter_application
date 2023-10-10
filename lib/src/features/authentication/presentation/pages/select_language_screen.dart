import 'package:dfs_flutter_application/src/features/authentication/presentation/provider/start_screen_provider.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/widgets/select_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    final startScreenProvider = Provider.of<StartScreenProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SelectButton(
          title: startScreenProvider.title,
          button: startScreenProvider.languageList,
          onClick: () {},
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/selectProfile');
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: const Text('Next'),
      ),
    );
  }
}
