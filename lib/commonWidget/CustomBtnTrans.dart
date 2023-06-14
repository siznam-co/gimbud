import 'package:flutter/material.dart';
class CustomBtnTrans extends StatelessWidget {
  Function? onTap;
  Color? borderColor,textColor;
  String? btnText;

  CustomBtnTrans({
    @required this.onTap,
    @required this.borderColor,
    @required this.textColor,
    @required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return InkWell(
      onTap:(){
        onTap!();
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor!),
        ),
        width: size.width,
        child: Center(
          child: Text(
            btnText!,
            style: TextStyle(
              color: textColor,
              fontSize: 18.0,
              fontFamily: 'semiBold',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
