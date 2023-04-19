import 'package:decore/utils/constant.dart';
import 'package:flutter/material.dart';

class RollPage extends StatelessWidget {
  const RollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("RollPage"),
      ),
    );
  }
}
