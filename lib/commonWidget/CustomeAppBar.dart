import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:gymbud/helper/Utilities.dart';
import 'package:gymbud/helper/customColors.dart';

class CustomAppbar extends StatelessWidget {
  String title;
  CustomAppbar(this.title);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 45,
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Navigator.canPop(context) ?
          InkWell(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: Navigator.canPop(context)?Container(
              width: 40,
              height: 40,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Transform(
                  transform:Utilities.language=="en"?Matrix4.rotationY(0): Matrix4.rotationY(math.pi),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/slicing/arrowBack.png',
                    color: Colors.white,
                  ),
                ),
              ),
            ):SizedBox(),
          ) :
          SizedBox(),
          SizedBox(
            width: Navigator.canPop(context)?0: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: CustomColor.whiteColor,
              fontSize: 18.0,
              fontFamily: 'semiBold',
            ),
          ),
        ],
      ),
    );
  }
}


