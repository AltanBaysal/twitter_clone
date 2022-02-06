import 'package:flutter/material.dart';

class SimpleInkwellTextButton extends StatelessWidget {
  const SimpleInkwellTextButton({
    Key? key,
    required this.func,
    required this.text,
  }) : super(key: key);

  final Function func;
  final String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => func(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
        child: Text(
          text,
          style: TextStyle(fontSize: width * 0.04),
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
    );
  }
}
