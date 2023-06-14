import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymbud/commonWidget/welcomePages.dart';
import 'package:gymbud/helper/locolizations.dart';
import 'package:gymbud/main.dart';
import 'package:gymbud/models/MDUser.dart';
import 'package:gymbud/pages/auth/LoginPage.dart';
import 'package:gymbud/pages/auth/RegisterOrLogin.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late Helper helper;
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (helper == null) {
      helper = Helper(context, size, showProgressDialog, updateState);
      // helper.apiSettings();
    }
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [helper.backgroundImage()],
      ),
    ));
  }

  void showProgressDialog(bool isShow) {
    if (mounted) {
      setState(() {
        this.isShow = isShow;
      });
    }
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }
}

class Helper {

  BuildContext context;
  Size size;
  Function showProgressDialog, updateState;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Helper(this.context, this.size, this.showProgressDialog, this.updateState) {
    // Future.delayed(Duration(milliseconds: 3500)).then((value) {
    //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    //         RegisterOrLogin()), (Route<dynamic> route) => false);
    // });
    Future.delayed(Duration(milliseconds: 2000)).then((value) {
      getUser();
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        //     WelcomePages()), (Route<dynamic> route) => false);
    });
  }

  Widget backgroundImage() {
    return Container(
      width: size.width,
      height: size.height,
      child: Image.asset(
        "assets/images/bg/splashBg.jpg",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget logoImage() {
    return Container(
      margin: EdgeInsets.only(
          top: size.height / 3,
          left: size.width * 0.10,
          right: size.width * 0.10),
      // width: size.width,
      // height: size.height,
      // child: Image.asset("assets/images/logo/logoGolden.png",fit: BoxFit.contain,),
    );
  }

  void showAlertDialog(String msg) {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text(AppLocalizations.of(context)!.trans('alert')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              msg,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  child: Text(
                    AppLocalizations.of(context)!.trans('close'),
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'semibold'),
                  ),
                  onTap: () {
                    exit(0);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future getUser() async {
    var v = FirebaseAuth.instance.currentUser;
    bool check=preferences.getBool('intro') ?? false;
    print("---"+check.toString());
    print("---"+v.toString());
    if (check==false) {
      await preferences.setBool('intro', true);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>WelcomePages()),
              (Route<dynamic> route) => false);
    }
    else{
      await preferences.setBool('intro', true);
      if (v != null) {
        await fireStore.collection('users').doc(v.uid).get().then((value) {
          var v = value.data();
          if (v != null) {
            // Utility.user = MDUser.fromMap(v);
          }

        });
      }
      else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => RegisterOrLogin()),
                (Route<dynamic> route) => false);
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => LoginOrCreateAccount()),
        //         (Route<dynamic> route) => false);
      }
    }
  }

}
