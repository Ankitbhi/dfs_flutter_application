import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/general.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/weather_advisory.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/provider/advisory_page_provider.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/scheme_eligible_criteria_widget.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/scheme_status_widget.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/sheme_detail_widget.dart';
import 'package:dfs_flutter_application/src/widgets/common_button.dart';
import 'package:dfs_flutter_application/src/widgets/common_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchemesDetailsPage extends StatefulWidget {
  const SchemesDetailsPage({super.key});

  @override
  State<SchemesDetailsPage> createState() => _SchemesDetailsPageState();
}

class _SchemesDetailsPageState extends State<SchemesDetailsPage> {
  List<Widget> schemesWidgets = [
    const SchemeDetailWidget(),
    const SchemeEligibleCriteriaWidget(),
    const SchemeStatusWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    final advisoryProvider = Provider.of<AdvisoryPageProvider>(context);

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
                itemCount: advisoryProvider.schemesDetailsNameList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                // physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommonTextButton(
                    onPressed: () {
                      advisoryProvider.changeSchemeDetailName(index);
                    },
                    iconText: advisoryProvider.schemesDetailsNameList[index],
                    selected: advisoryProvider.selectedScheme == index,
                    iconTextColor: advisoryProvider.selectedScheme == index
                        ? Colors.black
                        : Colors.black38,
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, width: 1, style: BorderStyle.solid),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: schemesWidgets[advisoryProvider.selectedScheme]),
                    SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: 'Apply',
                        width: MediaQuery.of(context).size.width * 0.4,
                        onpressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
