import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CropDetailsPage extends StatefulWidget {
  const CropDetailsPage({super.key});

  @override
  State<CropDetailsPage> createState() => _CropDetailsPageState();
}

class _CropDetailsPageState extends State<CropDetailsPage> {
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
                  const Text('Add more crop sown'),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Crop name'),
                  Text('Status'),
                ],
              ),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ExpansionTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text('Wheat'),
                        ),
                        Expanded(
                          child: Text('In review'),
                        ),
                      ],
                    ),
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('crop Name - Rice'),
                              Text('Cultivation')
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
