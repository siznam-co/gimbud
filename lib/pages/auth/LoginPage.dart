import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymbud/commonWidget/CustomBtn.dart';
import 'package:gymbud/commonWidget/CustomBtnTrans.dart';
import 'package:gymbud/commonWidget/CustomLoader.dart';
import 'package:gymbud/commonWidget/CustomTextField.dart';
import 'package:gymbud/commonWidget/CustomeAppBar.dart';
import 'package:gymbud/commonWidget/PasswordField.dart';
import 'package:gymbud/helper/Utilities.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/helper/Extension.dart';
import 'package:gymbud/pages/auth/ForgetPassword.dart';
import 'package:gymbud/pages/auth/RegisterAs.dart';
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  late Helper helper;
  bool isShow=false;

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    if(helper==null){
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
                        helper.passwordField(),
                        helper.forgotPassword(),
                        helper.loginBtn(),
                        helper.dontHaveAnAccount(),
                      ],
                    ),
                  ),
                ),
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

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final formGlobalKey = GlobalKey<FormState>();
  BuildContext context;
  Size size;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  Function showProgressDialog, updateState;

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
            } else if (!Utilities.validateEmail(val.trim())) {
              return  "Enter Valid Email";
            }
          },
          isMandatory: false,
          textInputType: TextInputType.emailAddress,
          isShowSuffixIcon: false,
        ),
      ],
    );
  }

  Widget passwordField() {
    return Column(
      children: [
        SizedBox(
          // height: size.width * 0.01,
        ),
        PasswordField(
          title: "password",
          hint: "password_hint",
          controller: passwordController,
          velidator: (val){
            if (val.isEmpty) {
              return "Enter Password";
            } else if (val.length < 6) {
              return "Enter is too short";
            } else if (val.length > 32) {
              return "Enter is too Long";
            }
          },
        ),
        SizedBox(
          height: size.width * 0.02,
        ),
      ],
    );
  }

  Widget dontHaveAnAccount() {
    return Column(
      children: [
        SizedBox(
          height: size.width * 0.01,
        ),
        InkWell(
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>RegisterAs()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "dont_have_an_account".tr(context) + "? ",
                style: TextStyle(
                  color: CustomColor.whiteColor,
                  fontSize: 16.0,
                  fontFamily: 'regular',
                ),
              ),
              Text(
                "click_here".tr(context),
                style: TextStyle(
                  color: CustomColor.redColor,
                  fontSize: 16.0,
                  fontFamily: 'semiBold',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.width * 0.05,
        ),
      ],
    );
  }

  Widget forgotPassword() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: size.width * 0.04,right:  size.width * 0.04,top:  size.width * 0.02),
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ForgetPassword()));
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "forgot_password".tr(context)+"?",
                style: TextStyle(
                  color: CustomColor.whiteColor,
                  fontSize: 16.0,
                  fontFamily: 'regular',
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.width * 0.03,
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

  Widget loginBtn() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.width * 0.04),
      child: CustomBtn(
        onTap: () {
          if(formGlobalKey.currentState!.validate()){
            loginFung();
          }
        },
        btnColor: CustomColor.redColor,
        textColor: CustomColor.whiteColor,
        btnText: "login".tr(context),
      ),
    );
  }

  Widget loginBtn1() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.width * 0.02),
      child: CustomBtnTrans(
        onTap: () {

        },
        borderColor: CustomColor.redColor,
        textColor: CustomColor.whiteColor,
        btnText: "login".tr(context),
      ),
    );
  }

  Future<void> loginFung( ) async {
    FocusScope.of(context).requestFocus(FocusNode());
    showProgressDialog(true);
    await auth
        .signInWithEmailAndPassword(
        email: emailController.text.trim(), password: passwordController.text.trim())
        .then((value) async {
      String uid = value.user!.uid.toString();
      await fireStore.collection('users').doc(uid).get().then((value) {
        showProgressDialog(false);
        var v = value.data();
        
      });
    })
        .catchError((error) {
          showProgressDialog(false);
          Utilities.showToast(error.message.toString(),context);
    });
  }


}

