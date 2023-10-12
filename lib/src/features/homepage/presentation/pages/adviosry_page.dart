import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/weather_advisory.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/provider/advisory_page_provider.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/general.dart';
import 'package:dfs_flutter_application/src/widgets/common_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvisoryPage extends StatefulWidget {
  const AdvisoryPage({super.key});

  @override
  State<AdvisoryPage> createState() => _AdvisoryPageState();
}

class _AdvisoryPageState extends State<AdvisoryPage> {
  @override
  Widget build(BuildContext context) {
    final advisoryProvider = Provider.of<AdvisoryPageProvider>(context);
    print(advisoryProvider.pageController);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: advisoryProvider.advisoryNameList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                // physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommonTextButton(
                    onPressed: () {
                      advisoryProvider.changeAdvisory(index);
                    },
                    iconText: advisoryProvider.advisoryNameList[index],
                    selected: advisoryProvider.selected == index,
                    iconTextColor: advisoryProvider.selected == index
                        ? Colors.black
                        : Colors.black38,
                  );
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    advisoryProvider.onSwipeLeft(); // Swipe from left to right
                  } else if (details.primaryVelocity! < 0) {
                    advisoryProvider.onSwipeRight(); // Swipe from right to left
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: PageView(
                    onPageChanged: advisoryProvider.onPageChanged,
                    controller: advisoryProvider.pageController,
                    children: advisoryProvider.advisoryWidgets,
                  ),
                  // advisoryWidgets[advisoryProvider.selected]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
