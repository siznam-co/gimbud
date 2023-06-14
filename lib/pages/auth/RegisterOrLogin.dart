import 'package:flutter/material.dart';
import 'package:gymbud/commonWidget/CustomBtn.dart';
import 'package:gymbud/commonWidget/CustomBtnTrans.dart';
import 'package:gymbud/commonWidget/CustomLoader.dart';
import 'package:gymbud/commonWidget/CustomeAppBar.dart';
import 'package:gymbud/helper/Extension.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/pages/auth/LoginPage.dart';
import 'package:gymbud/pages/auth/RegisterAs.dart';

class RegisterOrLogin extends StatefulWidget {
  @override
  _RegisterOrLoginState createState() => _RegisterOrLoginState();
}

class _RegisterOrLoginState extends State<RegisterOrLogin> {
  late Helper helper;
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (helper == null) {
      helper = Helper(context, size, showProgressDialog, updateState);
    }
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.black,
        child: CustomLoader(
          isLoading: isShow,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              helper.safeAreaTop(),
              helper.appBar(),
              helper.logoImage(),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  helper.loginBtn(),
                  helper.registerBtn(),
                ],
              )),
              helper.safeAreaBottom(),
            ],
          ),
        ),
      ),
    );
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
  String role = "user";

  Helper(this.context, this.size, this.showProgressDialog, this.updateState);

  Widget appBar() {
    return CustomAppbar("".tr(context));
  }

  Widget logoImage() {
    return Container(
      width: size.width / 2,
      margin: EdgeInsets.only(
          // top: size.width * 0.1,
          // left: size.width * 0.18,
          // right: size.width * 0.18,
          // bottom: size.width * 0.20,
          ),
      child: Image.asset(
        "assets/images/bg/login.jpg",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget safeAreaTop() {
    return Container(
      width: size.width,
      height: MediaQuery.of(context).padding.top,
    );
  }

  Widget safeAreaBottom() {
    return Container(
      width: size.width,
      height: MediaQuery.of(context).padding.bottom,
      color: Colors.transparent,
    );
  }

  Widget loginBtn() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.width * 0.02),
      child: CustomBtn(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginPage()));
        },
        btnColor: CustomColor.redColor,
        textColor: CustomColor.whiteColor,
        btnText: "login".tr(context),
      ),
    );
  }

  Widget registerBtn() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.width * 0.02),
      child: CustomBtnTrans(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => RegisterAs()));
        },
        borderColor: CustomColor.redColor,
        textColor: CustomColor.whiteColor,
        btnText: "lets_start".tr(context),
      ),
    );
  }
}
