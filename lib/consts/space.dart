import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  double? width;
  double? height;
  Widget? child;
  Space({Key? key, this.width, this.height, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}
