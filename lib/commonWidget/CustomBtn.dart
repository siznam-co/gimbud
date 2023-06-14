import 'package:flutter/material.dart';
class CustomBtn extends StatefulWidget {
  Function? onTap;
  Color? btnColor,textColor;
  String? btnText;

    CustomBtn({
    @required this.onTap,
    @required this.btnColor,
    @required this.textColor,
    @required this.btnText,
  });

  @override
  _CustomBtnState createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        widget.onTap!();
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.btnColor,
        ),
        width: size.width,
        child: Center(
          child: Text(
            widget.btnText!,
            style: TextStyle(
              color: widget.textColor,
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
