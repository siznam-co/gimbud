import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gymbud/commonWidget/CustomLoader.dart';
import 'package:gymbud/commonWidget/CustomTextField.dart';
import 'package:gymbud/commonWidget/CustomeAppBar.dart';
import 'package:gymbud/helper/Extension.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
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
        color: CustomColor.backgroundColor,
        child: CustomLoader(
          isLoading: isShow,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              helper.safeAreaTop(),
              helper.appBar(),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Form(
                      key: helper.formGlobalKey,
                      child: Column(
                        children: [
                          helper.logoImage(),
                          helper.ageField(),
                          helper.experienceField(),
                          helper.picImage(),
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

class Helper {
  BuildContext context;
  Size size;
  Function showProgressDialog, updateState;
  final formGlobalKey = GlobalKey<FormState>();
  int _ageValue = 18;
  int _expValue = 0;
  List<File> images = [];
  TextEditingController age = TextEditingController(text: 18.toString());
  TextEditingController exp = TextEditingController(text: 0.toString());

  Helper(this.context, this.size, this.showProgressDialog, this.updateState);

  Widget appBar() {
    return CustomAppbar("profile_filling".tr(context));
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
      child: Image.asset(
        "assets/images/bg/login.jpg",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget ageField() {
    return Column(
      children: [
        CustomTextField(
          title: "select_age",
          hint: "",
          controller: age,
          isSelectAble: true,
          isMandatory: false,
          textInputType: TextInputType.text,
          isShowSuffixIcon: false,
          ontap: () async {
            print("tap");
            await _ageDialog();
          },
        ),
      ],
    );
  }

  Widget experienceField() {
    return Column(
      children: [
        CustomTextField(
          title: "select_experience",
          hint: "",
          controller: exp,
          isSelectAble: true,
          isMandatory: false,
          textInputType: TextInputType.text,
          isShowSuffixIcon: false,
          ontap: () async {
            print("tap");
            await _expDialog();
          },
        ),
      ],
    );
  }

  Future _ageDialog() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: NumberPicker(
                        value: _ageValue,
                        minValue: 0,
                        maxValue: 100,
                        onChanged: (value) {
                          age = TextEditingController(text: value.toString());
                          _ageValue = value;
                          setState(() {});
                          updateState();
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Done"))
                  ],
                ),
              ),
            );
          });
        });
  }

  Future _expDialog() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: NumberPicker(
                        value: _expValue,
                        minValue: 0,
                        maxValue: int.parse(age.text)-18,
                        onChanged: (value) {
                          exp = TextEditingController(text: value.toString());
                          _expValue = value;
                          setState(() {});
                          updateState();
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Done"))
                  ],
                ),
              ),
            );
          });
        });
  }

  Widget picImage() {
    return Padding(
      padding: EdgeInsets.only(
          top: size.width * 0.045,
          left: size.width * 0.05,
          right: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "upload_display_pictures".tr(context),
                style: TextStyle(
                    color: CustomColor.whiteColor, fontSize: 15, fontFamily: "medium"),
              ),
              Text(
                '',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontFamily: 'bold',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(size.width * 0.02),
                child: InkWell(
                  onTap: () async {
                    openGalleryCameraPickDialog(false);
                  },
                  child: Container(
                    width: size.width / 3.2,
                    height: size.width / 3.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: -2),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width * 0.05,
                          height: size.width * 0.05,
                          child: Image.asset("assets/images/slicing/add.png",color: CustomColor.blackColor,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.width * 0.02),
                          child: Text(
                            "add_image".tr(context),
                            style:
                                TextStyle(fontSize: 14, fontFamily: "normal",color: CustomColor.blackColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              images.isNotEmpty
                  ? Container(
                height: size.width / 3.6,
                child: ListView.builder(
                    itemBuilder: (_, index) {
                      return Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(size.width * 0.03),
                            child: Container(
                              width: size.width / 3.2,
                              height: size.width / 3.6,
                              decoration: BoxDecoration(
                                  color: Color(0xffF5F6F7),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              images.removeAt(index);
                              updateState();
                            },
                            child: Container(
                              width: size.width * 0.07,
                              height: size.width * 0.07,
                              child: Image.asset(
                                  "assets/images/cross_with_bg.png"),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal),
              )
                  : SizedBox()
            ],
          )
        ],
      ),
    );
  }

  void openGalleryCameraPickDialog(bool isCard) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                child: Center(
                  child: Container(
                    height: 145,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            'select'.tr(context),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'medium',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                           'select_the_source'.tr(context),
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF999999),
                              fontFamily: 'medium',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                getImage(ImageSource.camera, isCard);
                              },
                              child: Container(
                                height: 32,
                                width: 105,
                                decoration: BoxDecoration(
                                ),
                                child: Center(
                                  child: Text(
                                   'camera'.tr(context),
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 13,
                                      fontFamily: 'bold',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                getImage(ImageSource.gallery, isCard);
                              },
                              child: Container(
                                height: 32,
                                width: 105,
                                decoration: BoxDecoration(
                                ),
                                child: Center(
                                  child: Text(
                                    'gallery'.tr(context),
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 13,
                                      fontFamily: 'bold',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        //
      },
    );
  }

  Future getImage(ImageSource sourceImage, bool isCard) async {
    final pickedFile = await ImagePicker().getImage(source: sourceImage);
    if (pickedFile != null) {
      File pickedImage = File(pickedFile.path);
      var croppedFile = await ImageCropper.platform.cropImage(
        sourcePath: pickedImage.path,
        aspectRatio: CropAspectRatio(ratioX: 620, ratioY: 620),
      );
      if(croppedFile!=null){
      if (isCard) {
        // cardImage = croppedFile;
      }
      else {
        images.add(File(croppedFile.path)) ;
        updateState();
       }
      }
    } else {
      print('No image selected.');
    }
    updateState();
  }


}
