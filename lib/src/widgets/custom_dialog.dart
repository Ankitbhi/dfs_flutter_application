import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String message;
  final VoidCallback? onNextPressed;
  final VoidCallback? onSkipPressed;

  const CustomDialog({
    super.key,
    required this.message,
    this.onNextPressed,
    this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check,
            color: Colors.black,
            size: 70,
          ),
          const Center(
            child: Text(
              'Successful',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onNextPressed != null) {
                    onNextPressed!();
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Next'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onSkipPressed != null) {
                    onSkipPressed!();
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Skip'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
