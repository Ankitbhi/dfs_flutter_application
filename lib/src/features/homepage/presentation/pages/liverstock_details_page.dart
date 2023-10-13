import 'package:dfs_flutter_application/src/features/homepage/presentation/provider/advisory_page_provider.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/add_button_widget.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/stock_details_widget.dart';
import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LivertockDetailsPage extends StatefulWidget {
  const LivertockDetailsPage({super.key});

  @override
  State<LivertockDetailsPage> createState() => _LivertockDetailsPageState();
}

class _LivertockDetailsPageState extends State<LivertockDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final advisoryProvider = Provider.of<AdvisoryPageProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              StockDetailsWidget(
                  name: 'Add Poultery',
                  onClick: advisoryProvider.addStock,
                  stockDetails: advisoryProvider.stockDetails!,
                  onEdit: advisoryProvider.enableEdit),
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
