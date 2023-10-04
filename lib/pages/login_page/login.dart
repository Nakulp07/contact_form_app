import 'package:contac_form_app/pages/auth/later_auth_service.dart';
import 'package:contac_form_app/pages/auth/data.dart';
import 'package:contac_form_app/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:contac_form_app/utils/colors.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () async {
            if (await AuthService().loginAction() == AuthState.signedin) {
              context.goNamed(FormAppconstants.welcomeRouteName);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => ColorsTheme().elevatedButtonBgColor),
          ),
          child: const Text(
            'Login',
          ),
        ),
      ],
    );
  }
}
