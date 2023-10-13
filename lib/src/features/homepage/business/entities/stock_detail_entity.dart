import 'package:flutter/material.dart';

class StockDetailEntity {
  final TextEditingController name;
  final TextEditingController quantity;
  final int id;
  bool enabled;
  StockDetailEntity({
    required this.name,
    required this.id,
    required this.quantity,
    this.enabled = false,
  });
}
