import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gymbud/helper/Extension.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/main.dart';
import 'package:gymbud/pages/auth/LoginPage.dart';
import 'package:gymbud/pages/auth/RegisterOrLogin.dart';

class WelcomePages extends StatefulWidget {
  @override
  _WelcomePagesState createState() => _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePages> {
  List<String> images = [
    "assets/images/bg/splashBg.jpg",
    "assets/images/bg/splashBg.jpg",
    "assets/images/bg/splashBg.jpg"
  ];
  int index = 0;
  PageController _controller = PageController(initialPage: 0, keepPage: false);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  PageView.builder(
                    controller: _controller,
                    onPageChanged: (i) {
                      setState(() {
                        index = i;
                      });
                    },
                    itemBuilder: (context, position) {
                      return Container(
                        child: Image.asset(
                          images[position],
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    itemCount: images.length, // Can be null
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: index < images.length - 1
                        ? InkWell(
                            onTap: () async {
                              await preferences.setBool('intro', true);
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  RegisterOrLogin()), (Route<dynamic> route) => false);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02,
                                  vertical: size.width * 0.01),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.only(
                                  left: size.width * 0.05,
                                  top: size.width * 0.05,
                                  right: size.width * 0.05),
                              child: Text(
                                "skip".tr(context),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            child: Text(
                              "skip".tr(context),
                              style: TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                  ),
                  Align(alignment: Alignment.bottomCenter,
                    child:  Container(
                      width: size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: CustomColor.whiteColor.withOpacity(0.2),
                        // borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(20),
                        //     topRight: Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (index > 0) {
                                _controller.animateToPage(index-1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                              }
                            },
                            child: Container(
                              margin:
                              EdgeInsets.symmetric(horizontal: size.width * 0.05),
                              child: Icon(
                                Icons.arrow_back_outlined,
                                color: index == 0
                                    ? CustomColor.unFocus
                                    : CustomColor.whiteColor,
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                                height: 8,
                                child: Center(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (_, listIndex) {
                                      return Center(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 4),
                                          width: listIndex == index ? 8 : 5,
                                          height: listIndex == index ? 8 : 5,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(50)),
                                        ),
                                      );
                                    },
                                    itemCount: images.length,
                                  ),
                                ),
                              )),
                          index==images.length-1?InkWell(
                            onTap: () async {
                              await preferences.setBool('intro', true);
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  RegisterOrLogin()), (Route<dynamic> route) => false);
                            },
                            child: Container(
                              margin:
                              EdgeInsets.symmetric(horizontal: size.width * 0.05),
                              child: Text(
                                "next".tr(context),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ):InkWell(
                            onTap: () {
                              if ( images.length - 1>index) {
                                _controller.animateToPage(index+1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                              }
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05),
                                child: Icon(
                                  Icons.arrow_forward_outlined,
                                  color: index == images.length - 1
                                      ? CustomColor.unFocus
                                      : CustomColor.whiteColor,
                                )),
                          )
                        ],
                      ),
                    )
                  ),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
