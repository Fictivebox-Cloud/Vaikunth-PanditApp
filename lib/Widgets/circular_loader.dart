import 'package:flutter/material.dart';
import '../Consts/color1.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: colorPrimary,
    );
  }
}
