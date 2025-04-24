import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';

Widget mainElevatedButton({
  required bool isLastPage,
  required PageController pageController,
  context,
}) {
  return ElevatedButton(
    style: ButtonStyle(
      minimumSize: WidgetStatePropertyAll<Size>(
        Size(200 , 50),
      ),
      elevation: WidgetStatePropertyAll<double>(
        3.5,
      ),
      backgroundColor: WidgetStatePropertyAll<Color>(
        Colors.blueGrey,
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    onPressed: (){
      if (isLastPage){
       Navigator.pushReplacementNamed(
           context,
           Routes.signInScreen,
       );
      } else {
        pageController.nextPage(
          duration: Duration(
            milliseconds: 500,
          ),
          curve: Curves.easeInOut,
        );
      }
    },
    child: Text(
      isLastPage ? 'Get Started' : 'Next Page',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
  );
}