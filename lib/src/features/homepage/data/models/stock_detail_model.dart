import 'package:dfs_flutter_application/src/features/homepage/business/entities/stock_detail_entity.dart';
import 'package:flutter/material.dart';

class StockDetailModel extends StockDetailEntity {
  StockDetailModel({
    required TextEditingController name,
    required int id,
    required TextEditingController quantity,
    required bool enabled,
  }) : super(
          name: name,
          id: id,
          quantity: quantity,
          enabled: enabled,
        );

  factory StockDetailModel.fromJson(Map<String, dynamic> json) {
    return StockDetailModel(
        name: TextEditingController(text: json['name']),
        id: json['id'],
        quantity: TextEditingController(text: json['quantity']),
        enabled: false);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name.text,
      'id': id,
      'quantity': quantity.text,
    };
  }
}
