import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          height: 50.h,
          width: 60.w,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
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
