import 'package:flutter/material.dart';

import '../constant.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onTap;

  final String? text;

  final EdgeInsetsGeometry? margin;
  const PrimaryButton({Key? key, this.onTap, this.text, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(vertical: 14.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: const Color(0xffAE835B).withOpacity(.25),
            ),
          ],
        ),
        child: Text(
          text ?? '',
          style: whiteBold20,
        ),
      ),
    );
  }
}
