import 'package:contac_form_app/pages/submitted_page/error_page.dart';
import 'package:contac_form_app/pages/submitted_page/submitted.dart';
import 'package:contac_form_app/routes/route_constants.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page/home.dart';
import 'package:contac_form_app/pages/form_page/ui/form.dart';

class FormAppRouter {
  GoRouter router = GoRouter(
    // object of go_router
    routes: // list of routes
        [
      GoRoute(
        // route to home page
        path: '/',
        name: FormAppconstants.homeRouteName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(child: Home());
        },
      ),
      GoRoute(
        // route to form page
        path: '/Form',
        name: FormAppconstants.formRouteName,
        pageBuilder: (context, state) {
          return MaterialPage(child: FormClass());
        },
      ),
      GoRoute(
        // route to form submitted page
        path: '/Submitted',
        name: FormAppconstants.exitRouteName,
        pageBuilder: (context, state) {
          return MaterialPage(child: SubmitSuccess());
        },
      ),
    ],
    // builder for the error page
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorClass());
    },
  );
}
