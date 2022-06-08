import 'package:flutter/material.dart';

class TwoLineItem extends StatelessWidget {
  const TwoLineItem({Key? key,required this.firstText,required this.secondText,required this.crossAxisAlignment}) : super(key: key);

  final String firstText,secondText;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(firstText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600
        ),),
        Text(secondText,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w200
          ),),
      ],
    );
  }
}
