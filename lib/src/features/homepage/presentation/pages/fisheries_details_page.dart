import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FisheriesDetailsPage extends StatefulWidget {
  const FisheriesDetailsPage({super.key});

  @override
  State<FisheriesDetailsPage> createState() => _FisheriesDetailsPageState();
}

class _FisheriesDetailsPageState extends State<FisheriesDetailsPage> {
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
                  const Text('Add Fisheries  '),
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
                        const Text('Tiger Prawan '),
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
