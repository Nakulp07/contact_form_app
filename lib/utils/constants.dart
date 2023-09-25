import 'package:flutter/material.dart';

import 'colors.dart';

// this file will have all constants used throughout  the app.

// Border outline for focused TextFormField
OutlineInputBorder textFormFieldFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0), // circular border with radius 5
  borderSide: BorderSide(
    color: ColorsTheme()
        .textFormFieldBorderColor, // colour from the colors.dart file is used
    width: 2.0, // width of the border
  ),
);

// Border outline for all enabled TextFormField
OutlineInputBorder textFormFieldEnabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);

// textstyle for label of  all the enabled TextFormFields
TextStyle enabledlabeltextStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

// textstyle for label of the focused TextFormField
TextStyle focusedlabeltextStyle = TextStyle(
  color: ColorsTheme().TextFormFieldLabelColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

// textstyle for all the headlines in th app
TextStyle headlineTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 30,
  fontWeight: FontWeight.w400,
  fontFamily: 'OpenSans',
);

// textstyle for all buttons in app
TextStyle buttonTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  color: Colors.white,
);
