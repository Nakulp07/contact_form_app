import 'package:contac_form_app/pages/auth/later_auth_service.dart';
import 'package:contac_form_app/pages/auth/data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_constants.dart';
import '../../utils/colors.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () async {
            if (await AuthService().logoutAction() == AuthState.notsignedin) {
              context.goNamed(FormAppconstants.welcomeRouteName);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => ColorsTheme().elevatedButtonBgColor),
          ),
          child: const Text('Logout'),
        ),
        ElevatedButton(
          onPressed: () => context.pushNamed(FormAppconstants.homeRouteName),
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => ColorsTheme().elevatedButtonBgColor),
          ),
          child: const Text('Go to home Page'),
        ),
      ],
    );
  }
}













// import 'package:auth0_flutter/auth0_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../routes/route_constants.dart';
// import '../../utils/colors.dart';

// class Profile extends StatelessWidget {
//   final Future<void> Function() logoutAction;
//   final UserProfile? user;

//   const Profile(this.logoutAction, this.user, {final Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           width: 150,
//           height: 150,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.blue, width: 4),
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: NetworkImage(user?.pictureUrl.toString() ?? ''),
//             ),
//           ),
//         ),
//         const SizedBox(height: 24),
//         Text('Name: ${user?.name}'),
//         const SizedBox(height: 48),
//         ElevatedButton(
//           onPressed: () async {
//             await logoutAction();
//           },
//           style: ButtonStyle(
//             backgroundColor: MaterialStateColor.resolveWith(
//                 (states) => ColorsTheme().elevatedButtonBgColor),
//           ),
//           child: const Text('Logout'),
//         ),
//         ElevatedButton(
//           onPressed: () => context.pushNamed(FormAppconstants.homeRouteName),
//           style: ButtonStyle(
//             backgroundColor: MaterialStateColor.resolveWith(
//                 (states) => ColorsTheme().elevatedButtonBgColor),
//           ),
//           child: const Text('Go to home Page'),
//         ),
//       ],
//     );
//   }
// }

