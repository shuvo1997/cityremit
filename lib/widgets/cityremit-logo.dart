import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CityRemitLogo extends StatelessWidget {
  String? imagePath;
  CityRemitLogo({Key? key, String? imagePath}) : super(key: key) {
    this.imagePath = imagePath!;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
            '${imagePath}cbl_main_logo.svg',
            height: 80.h,
            width: 180.w,
          )),
    );
  }
}
