import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/helper/locolizations.dart';

class PasswordField extends StatefulWidget {
  String? title, hint;
  TextEditingController? controller;
  Function? velidator;

  PasswordField({
    @required this.title,
    @required this.hint,
    @required this.controller,
    @required this.velidator,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obScure=true;

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
                          "",
                          style: TextStyle(
                              color: Colors.red, fontSize: 16, fontFamily: 'medium'),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                        // height: 50,
                        decoration: BoxDecoration(
                            // color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
                        child:TextFormField(
                          cursorColor: CustomColor.whiteColor,
                          obscureText: obScure,
                          validator: widget.velidator!(),
                          controller:  widget.controller,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            // WhitelistingTextInputFormatter(RegExp("[a-z A-Z. \u0600-\u06FF]")),
                            // WhitelistingTextInputFormatter(RegExp("[a-z A-Z á-ú Á-Ú 0-9]"))
                          ],
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
                              color: CustomColor.whiteColor,
                            ),
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  obScure=!obScure;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(15),
                                child: Image.asset(
                                  obScure? "assets/images/slicing/eyeOff.png":"assets/images/slicing/eyeOn.png",
                                  height: 16,
                                  width: 16,
                                  color:  CustomColor.whiteColor,
                                ),
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'regular',
                            color: CustomColor.whiteColor,
                          ),
                          maxLines: 1,
                        )),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
