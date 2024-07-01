import 'package:flutter/material.dart';
import 'package:face5/utilities/app_color.dart';
import 'package:face5/utilities/assestpath.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'activity/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // slideimage();
    _checkUserId();
  }

  Future<void> _checkUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userToken = preferences.getString('userID');

    await Future.delayed(Duration(seconds: 3));

    if (userToken != null && userToken.isNotEmpty) {
      /*Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBarView(),
        ),
      );*/
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: Center(
        child: Image(
          image: AssetImage(AssestPath.appLogo),
          height: 81,
          width: 253,
        ),
      ),
    );
  }
}
