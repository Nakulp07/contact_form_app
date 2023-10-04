import 'package:contac_form_app/routes/route_constants.dart';
import 'package:contac_form_app/utils/animations.dart';
import 'package:contac_form_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../utils/colors.dart';

class SubmitSuccess extends StatefulWidget {
  const SubmitSuccess({super.key});

  @override
  State<SubmitSuccess> createState() => _SubmitSuccessState();
}

class _SubmitSuccessState extends State<SubmitSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // text to display thst 'contact is saved'
            Text(
              'Contact Saved !! ',
              style: headlineTextStyle,
            ),
            // simple Lottie animation
            Lottie.asset(Animations().submitAnimation, width: 200, height: 300),
            const SizedBox(
              height: 20,
            ),
            // Elevated button to go back to the Home Page
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) =>
                    ColorsTheme()
                        .elevatedButtonBgColor), // backgound colour from constants file will be assigned to buton
              ),
              onPressed: () => context.goNamed(FormAppconstants.homeRouteName),
              child: Text(
                'Get back to Home Page',
                style:
                    buttonTextStyle, // constant text style used for elevated button text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
