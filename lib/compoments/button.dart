import 'package:ch_8_calculator/compoments/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CButton extends StatelessWidget {
  CButton(
      {Key? key,
      required this.title,
      this.colors = Colors.grey,
      required this.onPress})
      : super(key: key);

  final String title;
  final Color colors;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(shape: BoxShape.circle, color: colors),
            child: Center(
                child: Text(
              '$title',
              textAlign: TextAlign.center,
              style: myStyle,
            )),
          ),
        ),
      ),
    );
  }
}
