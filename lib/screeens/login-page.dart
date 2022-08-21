import 'package:cityremit/constants.dart';
import 'package:cityremit/widgets/background-image.dart';
import 'package:cityremit/widgets/cityremit-logo.dart';
import 'package:cityremit/widgets/drop-down.dart';
import 'package:cityremit/widgets/footer-icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String image_path = 'assets/images/';

  bool checkedValue = false;

  bool _isObsecure = true;

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.red, Colors.lightBlueAccent],
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
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CityRemitLogo(imagePath: image_path),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    const Text('Enter Info for login',
                        style: TextStyle(fontSize: 20)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: const [myBoxShadow],
                              gradient: const LinearGradient(
                                colors: [Colors.red, Colors.lightBlueAccent],
                              ),
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(50)),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: MyDropDownButton(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                border: InputBorder.none,
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(color: Colors.white)),
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                          )),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            boxShadow: const [myBoxShadow],
                            gradient: const LinearGradient(
                              colors: [Colors.red, Colors.lightBlueAccent],
                            ),
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(50)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              border: InputBorder.none,
                              hintText: 'Password',
                              suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0),
                                  child: IconButton(
                                    onPressed: _makeObsecure,
                                    icon: _obsecureIcon,
                                  )),
                              hintStyle: const TextStyle(color: Colors.white)),
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
                            const Text(
                              'Remember me',
                              style: bodyTextStyle,
                            )
                          ],
                        ),
                        const Text(
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
                            colors: [Colors.red, Colors.lightBlueAccent],
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      alignment: Alignment.center,
                      height: 80,
                      width: 80,
                      child: Image.asset('${image_path}fingerprint.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
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
        ),
      ],
    );
  }
}
