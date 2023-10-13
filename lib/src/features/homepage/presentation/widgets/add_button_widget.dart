import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key, required this.name, required this.onClick});
  final String name;
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        IconButton(
            onPressed: () {
              onClick();
            },
            icon: Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green[900],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                )))
      ],
    );
  }
}
