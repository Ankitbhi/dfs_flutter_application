import 'package:dfs_flutter_application/src/features/authentication/presentation/provider/start_screen_provider.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/widgets/select_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectProfileScreen extends StatefulWidget {
  const SelectProfileScreen({super.key});

  @override
  State<SelectProfileScreen> createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final startScreenProvider = Provider.of<StartScreenProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SelectButton(
          title: startScreenProvider.selectProfileTitle,
          button: startScreenProvider.selectProfile,
          onClick: () {},
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/signinPage');
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
