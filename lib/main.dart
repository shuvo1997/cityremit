import 'package:cityremit/screeens/login-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter CityRemit',
        theme: ThemeData(
          textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Colors.white),
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
      designSize: const Size(360, 640),
    );
  }
}
