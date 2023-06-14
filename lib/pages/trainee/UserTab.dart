import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gymbud/commonWidget/CustomLoader.dart';
import 'package:gymbud/helper/Utilities.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/helper/locolizations.dart';
class UserTab extends StatefulWidget {

  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  late Helper helper;
  bool isShow=false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (helper == null) {
      helper = Helper(context, size, showProgressDialog, updateState);
    }
    late DateTime _lastQuitTime;
    return WillPopScope(
      onWillPop: () {
        if(helper.index!=0){
          setState(() {
            helper.index=0;
          });
        }else{
          if (_lastQuitTime == null || DateTime.now().difference(_lastQuitTime).inSeconds > 1) {
           Utilities.showToast("exit_text", context);
            _lastQuitTime = DateTime.now();
          } else {
            exit(0);
          }
        }
        return Future(() => false);
      },
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          color: CustomColor.blackColor,
          child: SafeArea(
            child: Container(
              height: size.height,
              color: Colors.white,
              child: CustomLoader(
                isLoading: isShow,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(child: helper.body()),
                    helper.bottomAppBar()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showProgressDialog(bool isShow) {
    if (mounted) {
      setState(() {
        this.isShow=isShow;
        // if (isShow) {
        //   progressHUD.state.show();
        // } else {
        //   progressHUD.state.dismiss();
        // }
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
  int index = 0;
  Function showProgressDialog, updateState;

  Helper(
      this.context,
      this.size,
      this.showProgressDialog,
      this.updateState,
      );

  Widget bottomAppBar() {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: size.width*0.02),
      decoration: BoxDecoration(
        border: Border.all(width: 0.10),
        color: CustomColor.blackColor,
        // boxShadow: [
        //   BoxShadow(
        //       color: Theme.of(context).accentColor,
        //       offset: Offset(0, 0),
        //       blurRadius: 5,
        //       spreadRadius: 0)
        // ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: InkWell(
                onTap: () {
                  index = 0;
                  updateState();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height:size.width * 0.07,
                      width: size.width * 0.07,
                      // color: Theme.of(context).accentColor,
                      child: Center(
                        child: Image.asset(
                          "assets/images/slicing/home.png",
                          height:index==0? size.width * 0.07:size.width * 0.06,
                          width: index==0? size.width * 0.07:size.width * 0.06,
                          color:  CustomColor.whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.trans('home'),
                      style: TextStyle(
                        color:  CustomColor.whiteColor,
                        fontSize: 12.0,
                        fontFamily: index==0?'bold':'regular',
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
              child: InkWell(
                onTap: () {
                  index = 1;
                  updateState();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height:size.width * 0.07,
                      width: size.width * 0.07,
                      // color: Theme.of(context).accentColor,
                      child: Center(
                        child: Image.asset(
                          "assets/images/slicing/home.png",
                          height:index==1? size.width * 0.07:size.width * 0.06,
                          width: index==1? size.width * 0.07:size.width * 0.06,
                          color:  CustomColor.whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.trans('leading'),
                      style: TextStyle(
                        color:  CustomColor.whiteColor,
                        fontSize: 12.0,
                        fontFamily: index==1?'bold':'regular',
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                index = 2;
                updateState();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:size.width * 0.07,
                    width: size.width * 0.07,
                    child: Center(
                      child: Image.asset(
                        "assets/images/slicing/home.png",
                        height:index==2? size.width * 0.07:size.width * 0.06,
                        width: index==2? size.width * 0.07:size.width * 0.06,
                        color:  CustomColor.whiteColor,
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.trans('posts'),
                    style: TextStyle(
                      color:  CustomColor.whiteColor,
                      fontSize: 12.0,
                      fontFamily: index==2?'bold':'regular',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                index = 3;
                updateState();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:size.width * 0.07,
                    width: size.width * 0.07,
                    // color: Theme.of(context).accentColor,
                    child: Center(
                      child: Image.asset(
                        "assets/images/slicing/home.png",
                        height:index==3? size.width * 0.07:size.width * 0.06,
                        width: index==3? size.width * 0.07:size.width * 0.06,
                        color:  CustomColor.whiteColor,
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.trans('profile'),
                    style: TextStyle(
                      color:  CustomColor.whiteColor,
                      fontSize: 12.0,
                      fontFamily: index==3?'bold':'regular',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Container(
      width: size.width,
      height: size.height,
      child: IndexedStack(
        children: [
         Container(child: Center(child: Text("Home"),),),
         Container(child: Center(child: Text("board"),),),
         Container(child: Center(child: Text("vidoes"),),),
         Container(child: Center(child: Text("profile"),),),

        ],
        index: index,
      ),
    );
  }

}
