import 'package:dfs_flutter_application/core/constants/app_color.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/advertisement_box.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/categories.dart';
import 'package:dfs_flutter_application/src/widgets/common_single_select_dropdown.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: GestureDetector(
          child: Transform.scale(scale: 0.4, child: const Icon(Icons.abc)),
        ),
        title: const Text('DFS'),
        actions: const <Widget>[],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                CustomDropdownSearch<String>(
                  items: const ["Option 1", "Option 2", "Option 3"],
                  onChanged: (selectedItem) {
                    // Handle the selected item here
                  },
                  hint: "Select an option",
                ),
                const AdvertisementBox(),
                const Categories(),
                // Add more widgets as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
