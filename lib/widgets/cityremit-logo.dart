import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CityRemitLogo extends StatelessWidget {
  String? imagePath;
  CityRemitLogo({Key? key, String? imagePath}) : super(key: key) {
    this.imagePath = imagePath!;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Container(
          height: 100,
          width: 240,
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
            '${imagePath}cbl_main_logo.svg',
            height: 100,
            width: 200,
          )),
    );
  }
}
