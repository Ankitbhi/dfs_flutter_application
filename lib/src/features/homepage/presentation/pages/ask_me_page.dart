import 'package:dfs_flutter_application/src/widgets/common_button.dart';
import 'package:dfs_flutter_application/src/widgets/common_single_select_dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AksMePage extends StatefulWidget {
  const AksMePage({super.key});

  @override
  State<AksMePage> createState() => _AksMePageState();
}

class _AksMePageState extends State<AksMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(right: 18.0, left: 18, top: 18),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Ask me',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomDropdownSearch<String>(
              items: ['item1', 'item2', 'item3'],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomDropdownSearch<String>(
              items: ['item1', 'item2', 'item3'],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                text: 'Ask me',
                width: MediaQuery.of(context).size.width * 0.4,
                onpressed: () {},
              ),
            ),
            const Text(
              'FAQ',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'FAQ Question 1 with answer',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
