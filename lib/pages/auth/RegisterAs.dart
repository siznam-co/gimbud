import 'package:flutter/material.dart';
import 'package:gymbud/commonWidget/CustomBtn.dart';
import 'package:gymbud/commonWidget/CustomLoader.dart';
import 'package:gymbud/commonWidget/CustomeAppBar.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/helper/locolizations.dart';
import 'package:gymbud/pages/auth/Register.dart';
class RegisterAs extends StatefulWidget {

  @override
  _RegisterAsState createState() => _RegisterAsState();
}

class _RegisterAsState extends State<RegisterAs> {
  late Helper helper;
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    if (helper == null) {
      helper = Helper(context, size, showProgressDialog, updateState);
    }
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: CustomColor.blackColor,
        child: CustomLoader(
          isLoading: isShow,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              helper.safeAreaTop(),
              helper.appBar(),
              Expanded(child: helper.selectRole()),
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
  String role="trainer";
  Helper(this.context, this.size, this.showProgressDialog, this.updateState);

  Widget appBar() {
    return CustomAppbar(AppLocalizations.of(context)!.trans("register_as")+" "+(role=="trainer"?AppLocalizations.of(context)!.trans("trainer"):AppLocalizations.of(context)!.trans("trainee")));
  }

  Widget selectRole() {
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          logoImage(),
          roleText(),
          user(),
          celebrity(),
          nextBtn()
        ],
      ),
    );
  }

  Widget roleText() {
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: size.width*0.04),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          AppLocalizations.of(context)!.trans("select_your_role_to_proceed"),
          style: TextStyle(
            color: CustomColor.whiteColor,
            fontSize: 20.0,
            fontFamily: 'regular',
          ),
        ),
      ),
    );
  }

  Widget user() {
    return InkWell(
      onTap: (){
        role = "trainer";
        updateState();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.width*0.01),
        padding: EdgeInsets.symmetric(horizontal: size.width*0.04,vertical: size.width*0.04),
        decoration: BoxDecoration(
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: -2)
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.trans("trainer"),
              style: TextStyle(
                color:role == "trainer"?CustomColor.blackColor: Color(0xff999999),
                fontSize: 16.0,
                fontFamily: 'semiBold',
              ),
            ),
            Image.asset(role == "trainer"
                ? "assets/images/slicing/selectedRadio.png"
                : "assets/images/slicing/unSelectedRadio.png",
              height: size.width * 0.04, width: size.width * 0.04,)
          ],
        ),
      ),
    );
  }

  Widget celebrity() {
    return InkWell(
      onTap: (){
        role = "trainee";
        updateState();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.width*0.01),
        padding: EdgeInsets.symmetric(horizontal: size.width*0.04,vertical: size.width*0.04),
        decoration: BoxDecoration(
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: -2)

            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.trans("trainee"),
              style: TextStyle(
                color: role == "trainee"?CustomColor.blackColor: Color(0xff999999),
                fontSize: 16.0,
                fontFamily: 'semiBold',
              ),
            ),
            Image.asset(role == "trainee"
                ? "assets/images/slicing/selectedRadio.png"
                : "assets/images/slicing/unSelectedRadio.png",
              height: size.width * 0.04, width: size.width * 0.04,)
          ],
        ),
      ),
    );
  }

  Widget nextBtn() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.width*0.04),
      child: CustomBtn(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Register(isUser: role == "trainee"?true:false)));
        },
        btnColor: CustomColor.redColor,
        textColor: CustomColor.whiteColor,
        btnText: AppLocalizations.of(context)!.trans("next"),
      ),
    );
  }

  Widget logoImage() {
    return Container(
      width: size.width/2,
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

}

