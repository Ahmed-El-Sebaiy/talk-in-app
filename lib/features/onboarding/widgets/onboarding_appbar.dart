import 'package:flutter/material.dart';
import 'package:talk_in_app/core/helpers/extensions.dart';

import '../../../core/routing/routes.dart';

Widget onBoardingAppBar(BuildContext context){
  return AppBar(
    elevation: 1.2,
    actions: [
      TextButton(
        onPressed: (){
          context.pushReplacementNamed(Routes.signInScreen);
        },
        child: Text(
          'Skip',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}