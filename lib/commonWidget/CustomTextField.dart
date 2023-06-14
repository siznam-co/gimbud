import 'package:flutter/material.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/helper/locolizations.dart';
class CustomTextField extends StatefulWidget {
  String? title, hint,suffixIcon;
  Function? ontap,velidation;
  bool? isMandatory,isShowSuffixIcon,isSelectAble;
  TextInputType? textInputType;
  TextEditingController? controller;

  CustomTextField({
    this.ontap,
    this.velidation,
    this.title,
    this.isSelectAble = false,
    this.hint,
    this.isMandatory,
    this.suffixIcon,
    this.controller,
    this.isShowSuffixIcon,
    this.textInputType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();

}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: size.width*0.025,horizontal: size.width*0.04),
                  // color:CustomColor.whiteColor.withOpacity(0.4),
                  child: Row(
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.trans(widget.title!),
                        style: TextStyle(
                            color:  CustomColor.whiteColor,
                            fontSize: 16,
                            fontFamily: 'semiBold'),
                      ),
                      Text(
                        widget.isMandatory! ? ' *' : "",
                        style: TextStyle(
                            color: Colors.red, fontSize: 16, fontFamily: 'medium'),
                      )
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        // color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
                    child: Center(child: TextFormField(
                      validator: widget.velidation!(),
                      readOnly:widget.isSelectAble!,
                      onTap:(){
                        widget.isSelectAble! ?widget.ontap!():null;
                      },
                      controller:  widget.controller,
                      keyboardType: widget.textInputType,
                      inputFormatters: [
                        // WhitelistingTextInputFormatter(RegExp("[a-z A-Z. \u0600-\u06FF]")),
                        // WhitelistingTextInputFormatter(RegExp("[a-z A-Z á-ú Á-Ú 0-9]"))
                      ],
                      cursorColor: CustomColor.whiteColor,
                      decoration: InputDecoration(
                        fillColor:  Colors.white.withOpacity(0.2),
                        filled: true,
                        focusColor: CustomColor.whiteColor,
                        contentPadding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8.0),
                          ),
                          borderSide: new BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                        hintText: AppLocalizations.of(context)!.trans(widget.hint!),
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'regular',
                          color:CustomColor.whiteColor,
                        ),
                        suffixIcon: widget.isShowSuffixIcon!?InkWell(
                          onTap: (){},
                          child: Container(
                            margin: EdgeInsets.all(18),
                            child: Image.asset(
                              widget.suffixIcon!,
                              height: 8,
                              width: 8,
                              color: CustomColor.whiteColor,
                              // color: CustomColor.textFieldHintColor,
                            ),
                          ),
                        ):SizedBox(),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'regular',
                        color:  CustomColor.whiteColor,
                      ),
                      maxLines: 1,
                    ),
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
