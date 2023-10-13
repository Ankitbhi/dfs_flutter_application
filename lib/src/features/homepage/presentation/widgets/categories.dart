import 'package:dfs_flutter_application/src/features/homepage/presentation/provider/advisory_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final double boxWidth = 100.0;
  final double spacing = 8.0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / (boxWidth + spacing)).floor();
    final advisoryProvider = Provider.of<AdvisoryPageProvider>(context);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/registration');
          },
          child: Column(children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[
                    300], // Set the desired color for the circular container
              ),
            ),
            Text('profile',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
          ]),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                advisoryProvider.nevigateMethod(index, context);
              },
              child: Column(children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[
                        300], // Set the desired color for the circular container
                  ),
                ),
                Text(advisoryProvider.homeNameList[index],
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              ]),
            );
          },
          itemCount: advisoryProvider.homeNameList.length,
        ),
      ],
    );
  }
}
