import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LivertockDetailsPage extends StatefulWidget {
  const LivertockDetailsPage({super.key});

  @override
  State<LivertockDetailsPage> createState() => _LivertockDetailsPageState();
}

class _LivertockDetailsPageState extends State<LivertockDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Add Poultery '),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                ],
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[200]!,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Type'),
                    Text('Qty'),
                    SizedBox(),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[200]!,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Text('Country Chicken '),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: CustomInput(
                            isRequired: false,
                            bottomPadding: 0,
                            topTextPadding: 5,
                            border: InputBorder.none,
                            borderNone: true,
                            bottomTextPadding: 5,
                            controller: TextEditingController(),
                            enabled: false,
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit))
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: const Divider(
                  color: Colors.black87,
                  height: 20,
                  thickness: 3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
