import 'package:cityremit/constants.dart';
import 'package:cityremit/widgets/background-image.dart';
import 'package:cityremit/widgets/cityremit-logo.dart';
import 'package:cityremit/widgets/drop-down.dart';
import 'package:cityremit/widgets/footer-icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String image_path = 'assets/images/';

  bool checkedValue = false;

  bool _isObsecure = true;

  Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.blue, Colors.pinkAccent],
  ).createShader(const Rect.fromLTRB(100.0, 50.0, 10.0, 50.0));

  Icon _obsecureIcon = const Icon(
    Icons.visibility_off,
    color: Colors.white,
  );

  void _makeObsecure() {
    setState(() {
      if (_isObsecure) {
        _isObsecure = false;
        _obsecureIcon = const Icon(
          Icons.visibility,
          color: Colors.white,
        );
      } else {
        _isObsecure = true;
        _obsecureIcon = const Icon(
          Icons.visibility_off,
          color: Colors.white,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const BackgroundImage(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CityRemitLogo(imagePath: image_path),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    Text('Enter Info for login',
                        style: TextStyle(fontSize: 20.sp)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: const [myBoxShadow],
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.pinkAccent,
                                  Colors.pink,
                                  Colors.blue
                                ],
                              ),
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(30.r)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(right: 10.0.w),
                                  child: const MyDropDownButton(),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 15.h),
                                border: InputBorder.none,
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(
                                    fontSize: 15.sp, color: Colors.white)),
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                          )),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            boxShadow: const [myBoxShadow],
                            gradient: const LinearGradient(
                              colors: [
                                Colors.pinkAccent,
                                Colors.pink,
                                Colors.blue
                              ],
                            ),
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(30.r)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0.w, vertical: 15.h),
                              border: InputBorder.none,
                              hintText: 'Password',
                              suffixIcon: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: IconButton(
                                    onPressed: _makeObsecure,
                                    icon: _obsecureIcon,
                                  )),
                              hintStyle: TextStyle(
                                  fontSize: 15.sp, color: Colors.white)),
                          obscureText: _isObsecure,
                          style: const TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.done,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: checkedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValue = newValue!;
                                  });
                                }),
                            Text(
                              'Remember me',
                              style: bodyTextStyle,
                            )
                          ],
                        ),
                        Text(
                          'Forgot Password?',
                          style: bodyTextStyle,
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          boxShadow: const [myBoxShadow],
                          gradient: const LinearGradient(
                            colors: [
                              Colors.pinkAccent,
                              Colors.pink,
                              Colors.blue
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30.r)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0.h),
                      alignment: Alignment.center,
                      height: 65.h,
                      width: 65.w,
                      child: Image.asset('${image_path}fingerprint.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          FooterIcon(
                            imagePath: 'assets/images/ic_today_rate.svg',
                            bottomText: 'Today\'s Rate',
                          ),
                          FooterIcon(
                              imagePath: 'assets/images/ic_register.svg',
                              bottomText: 'Register'),
                          FooterIcon(
                              imagePath: 'assets/images/ic_support.svg',
                              bottomText: 'Support'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
