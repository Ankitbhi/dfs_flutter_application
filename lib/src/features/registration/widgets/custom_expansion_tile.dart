import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;

  CustomExpansionTile({required this.title, required this.children});

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          title: widget.title,
         
        ),
        if (_isExpanded)
          ...widget.children.map((child) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: child,
              ))
      ],
    );
  }
}
