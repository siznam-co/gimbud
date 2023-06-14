import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymbud/commonWidget/CustomBtn.dart';
import 'package:gymbud/commonWidget/CustomLoader.dart';
import 'package:gymbud/commonWidget/CustomTextField.dart';
import 'package:gymbud/commonWidget/CustomeAppBar.dart';
import 'package:gymbud/commonWidget/PasswordField.dart';
import 'package:gymbud/helper/Extension.dart';
import 'package:gymbud/helper/Utilities.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/helper/locolizations.dart';
import 'package:gymbud/models/MDUser.dart';
import 'package:gymbud/pages/auth/LoginPage.dart';
class Register extends StatefulWidget {
  bool isUser;

  Register({
    required this.isUser,
  });
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  late Helper helper;
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (helper == null) {
      helper = Helper(context, size, showProgressDialog, updateState,widget.isUser);
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
                child: GestureDetector(
                  onTap:(){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Form(
                      key:helper.formGlobalKey,
                      child: Column(
                        children: [
                          helper.logoImage(),
                          helper.nameField(),
                          helper.emailField(),
                          helper.passwordField(),
                          helper.confirmPasswordField(),
                          helper.registerBtn(),
                          helper.alreadyHaveAnAccount()
                        ],
                      ),
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

class Helper{
  BuildContext context;
  Size size;
  Function showProgressDialog, updateState;
  final formGlobalKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();

  bool isUser;

  Helper(this.context, this.size, this.showProgressDialog, this.updateState,this.isUser);

  Widget appBar() {
    return CustomAppbar("register".tr(context));
  }

  Widget logoImage() {
    return Container(
      width: size.width/2,
      child: Image.asset(
        "assets/images/bg/login.jpg",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget nameField() {
    return Column(
      children: [
        CustomTextField(
          title: "full_name",
          hint: "full_name_hint",
          controller: name,
          velidation: (val){
            if(val.isEmpty){
              return "please_enter_name".tr(context);
            }

          },
          isMandatory: false,
          textInputType: TextInputType.text,
          isShowSuffixIcon: false,
        ),
      ],
    );
  }

  Widget emailField() {
    return Column(
      children: [
        CustomTextField(
          title: "email",
          hint: "email_hint",
          controller: email,
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
          controller: password,
            velidator: (val){
              if (val.isEmpty) {
                return "Enter Password";
              } else if (val.length < 6) {
                return "Enter is too short";
              } else if (val.length > 32) {
                return "Enter is too Long";
              }
            }
        ),
        SizedBox(
          height: size.width * 0.02,
        ),
      ],
    );
  }

  Widget confirmPasswordField() {
    return Column(
      children: [
        SizedBox(
          // height: size.width * 0.01,
        ),
        PasswordField(
          title: "confirm_password",
          hint: "password_hint",
          controller: confirmPassword,
          velidator:  (val){
              if(val!=password.text){
                return "Passwords are not match";
              }
              else if (val.isEmpty) {
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

  Widget registerBtn() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.width * 0.04),
      child: CustomBtn(
        onTap: () {
          if(formGlobalKey.currentState!.validate()){
            FocusScope.of(context).requestFocus(FocusNode());
            print("password = ${password.text}");
            print("password = ${confirmPassword.text}");
            print("password = ${email.text}");
            print("password = ${name.text}");
            // regFung();
          }
        },
        btnColor: CustomColor.redColor,
        textColor: CustomColor.whiteColor,
        btnText: "register".tr(context),
      ),
    );
  }

  Widget alreadyHaveAnAccount() {
    return Column(
      children: [
        SizedBox(
          height: size.width * 0.01,
        ),
        InkWell(
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginPage()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.trans("already_have_an_account") + "? ",
                style: TextStyle(
                  color: CustomColor.whiteColor,
                  fontSize: 16.0,
                  fontFamily: 'regular',
                ),
              ),
              Text(
                AppLocalizations.of(context)!.trans("login_here"),
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

  Future<void> regFung() async {
    showProgressDialog(true);
    await auth
        .createUserWithEmailAndPassword(
        email: email.text, password: password.text)
        .then((value) async {
      String uid = value.user!.uid.toString();
      MDUser user = MDUser(uid: uid, name: name.text, email: email.text, userType:isUser?"trainee":"trainer");
      Utilities.user = user;
      await fireStore.collection("users").doc(user.uid).set(user.toMap());
      showProgressDialog(false);
      Utilities.showToast('register_successfully',context);
    }).catchError((error) {
      showProgressDialog(false);
      Utilities.showToast(error.message.toString(),context);
    });
  }

}
