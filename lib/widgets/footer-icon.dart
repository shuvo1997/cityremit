import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class FooterIcon extends StatelessWidget {
  final String imagePath;
  final String bottomText;
  final VoidCallback? action;

  const FooterIcon(
      {Key? key,
      required this.imagePath,
      required this.bottomText,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12)),
          child: SvgPicture.asset(imagePath),
        ),
        Text(
          bottomText,
          style: bodyTextStyle,
        ),
      ],
    );
  }
}
