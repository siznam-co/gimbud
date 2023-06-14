import 'package:flutter/material.dart';
import 'package:gymbud/helper/locolizations.dart';

extension translate on String{
  String tr(BuildContext context) {
    if (this != null)
      return AppLocalizations.of(context)!.trans(this);
    else
      return '';
  }

}

