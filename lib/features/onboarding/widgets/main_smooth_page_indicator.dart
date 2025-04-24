import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget mainSmoothPageIndicator({required PageController controller}) {

  return SmoothPageIndicator(
    controller: controller,
    count: 3,
    effect: WormEffect(
      activeDotColor: Colors.blue,
      dotHeight: 15,
      dotWidth: 15,
    ),
  );
}