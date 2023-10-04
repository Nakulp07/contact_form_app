import 'package:contac_form_app/routes/route_constants.dart';
import 'package:contac_form_app/utils/animations.dart';
import 'package:contac_form_app/utils/colors.dart';
import 'package:contac_form_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contact Form App',
              style: headlineTextStyle,
            ),
            // simple lottie animation for home page
            Lottie.asset(Animations().homepageAnimation),
            // Elevated Button for routing to form page
            ElevatedButton(
              onPressed: () => context.pushNamed(FormAppconstants
                  .formRouteName), // route for form page using pushNamed by assigning name for form page route
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) =>
                    ColorsTheme()
                        .elevatedButtonBgColor), // background colour for elevated button from util/colours file
              ),
              child: Text(
                'Let\'s add a new contact',
                style: buttonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
