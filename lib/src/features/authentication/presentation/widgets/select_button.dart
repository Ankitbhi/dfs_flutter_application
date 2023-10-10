import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({
    super.key,
    required this.title,
    required this.button,
    required this.onClick,
  });
  final String title;
  final List<String> button;
  final Function onClick;
  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
              const SizedBox(height: 24),
              ...widget.button.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GestureDetector(
                    child: Container(
                        height: 71,
                        width: MediaQuery.of(context).size.width * .8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                        ),
                        child: Center(
                            child: Text(
                          e,
                          style: const TextStyle(fontSize: 16),
                        ))),
                  ),
                );
              }),
            ]),
      ),
    );
  }
}
