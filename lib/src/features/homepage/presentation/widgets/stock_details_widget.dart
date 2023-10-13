import 'package:dfs_flutter_application/src/features/homepage/business/entities/stock_detail_entity.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/add_button_widget.dart';
import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StockDetailsWidget extends StatefulWidget {
  const StockDetailsWidget({
    super.key,
    required this.name,
    required this.onClick,
    required this.stockDetails,
    required this.onEdit,
  });
  final String name;
  final Function onClick;
  final Function onEdit;
  final List<StockDetailEntity> stockDetails;
  @override
  State<StockDetailsWidget> createState() => _StockDetailsWidgetState();
}

class _StockDetailsWidgetState extends State<StockDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddButtonWidget(
            name: widget.name,
            onClick: () {
              widget.onClick();
            }),
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
              Text('Type',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              Text('Qty',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ListView.builder(
          itemCount: widget.stockDetails.length,
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
                  Expanded(
                    child: CustomInput(
                      isRequired: false,
                      bottomPadding: 0,
                      topTextPadding: 5,
                      border: InputBorder.none,
                      borderNone: true,
                      bottomTextPadding: 5,
                      controller: widget.stockDetails[index].name,
                      enabled: widget.stockDetails[index].enabled,
                    ),
                  ),
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
                      controller: widget.stockDetails[index].quantity,
                      enabled: widget.stockDetails[index].enabled,
                      type: 'number',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.onEdit(index);
                    },
                    icon: widget.stockDetails[index].enabled
                        ? const Icon(Icons.edit_off)
                        : const Icon(Icons.edit),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
