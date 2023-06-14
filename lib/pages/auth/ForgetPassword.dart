import 'package:flutter/material.dart';
import 'package:gymbud/commonWidget/CustomBtn.dart';
import 'package:gymbud/commonWidget/CustomLoader.dart';
import 'package:gymbud/commonWidget/CustomTextField.dart';
import 'package:gymbud/commonWidget/CustomeAppBar.dart';
import 'package:gymbud/helper/Extension.dart';
import 'package:gymbud/helper/Utilities.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/helper/locolizations.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
        color: CustomColor.blackColor,
        child: CustomLoader(
          isLoading: isShow,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              helper.safeAreaTop(),
              helper.appBar(),
              Expanded(
                child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Form(
                      key: helper.formGlobalKey,
                      child: Column(
                        children: [
                          helper.logoImage(),
                          helper.emailField(),
                          helper.loginBtn(),
                        ],
                      ),
                    )),
              ),
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
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();


  Helper(this.context, this.size, this.showProgressDialog, this.updateState);

  Widget appBar() {
    return CustomAppbar("login".tr(context));
  }

  Widget emailField() {
    return Column(
      children: [
        CustomTextField(
          title: "email",
          hint: "email_hint",
          controller:emailController ,
          velidation: (val){
            if (val.isEmpty) {
              return "Enter Email";
              // Get.snackbar("Email Error", "Enter Email");
            } else if (!Utilities.validateEmail(val.trim())) {
              return  "Enter Valid Email";
              // Get.snackbar("Email Error", "Enter Valid Email");
            }
          },
          isMandatory: false,
          textInputType: TextInputType.emailAddress,
          isShowSuffixIcon: false,
        ),
      ],
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

  Widget loginBtn() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.width * 0.04),
      child: CustomBtn(
        onTap: () {
          if(formGlobalKey.currentState!.validate()){
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        btnColor: CustomColor.redColor,
        textColor: CustomColor.whiteColor,
        btnText: "send".tr(context),
      ),
    );
  }

  Widget roleText() {
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: size.width * 0.04),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          AppLocalizations.of(context)!.trans("forget_email_text"),
          style: TextStyle(
            color: CustomColor.whiteColor,
            fontSize: 20.0,
            fontFamily: 'regular',
          ),
        ),
      ),
    );
  }
}
