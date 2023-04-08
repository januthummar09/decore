import 'package:flutter/material.dart';

import '../constant.dart';

class DecorateContainer extends StatelessWidget {
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final double? blurRadius;
  final double? height;
  final double? width;
  final double? borderRadius;
  const DecorateContainer({Key? key, this.alignment, this.padding, this.margin, this.child, this.blurRadius, this.height, this.width, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        alignment: alignment,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 15.5),
        margin: margin ?? const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(borderRadius ?? 10), boxShadow: [
          BoxShadow(
            color: colorForShadow,
            blurRadius: blurRadius ?? 3,
            offset: const Offset(0, 0),
          ),
        ]),
        child: child);
  }
}
