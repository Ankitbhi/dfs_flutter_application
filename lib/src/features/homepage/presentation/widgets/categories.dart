import 'package:flutter/material.dart';

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

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: boxWidth,
          height: boxWidth,
          child: Column(children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[
                    300], // Set the desired color for the circular container
              ),
            ),
            const Text('name',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
          ]),
        );
      },
      itemCount: 9,
    );
  }
}
