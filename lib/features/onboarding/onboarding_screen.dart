import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_in_app/constants/constants.dart';
import 'package:talk_in_app/core/helpers/extensions.dart';
import 'package:talk_in_app/core/helpers/spacing.dart';
import 'package:talk_in_app/core/routing/app_router.dart';
import 'package:talk_in_app/core/routing/routes.dart';
import 'package:talk_in_app/features/onboarding/widgets/build_page_view.dart';
import 'package:talk_in_app/features/onboarding/widgets/main_elevated_button.dart';
import 'package:talk_in_app/features/onboarding/widgets/main_smooth_page_indicator.dart';
import 'package:talk_in_app/features/onboarding/widgets/onboarding_appbar.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  AppRouter appRouter = AppRouter();
  final PageController _pageController = PageController(
    keepPage: true,
    viewportFraction: 0.8,
  );
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          onBoardingAppBar(context),
          Expanded(
              child: PageView(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                children: [
                  buildPageView(
                      image: Constants.onBoardingFirstImage,
                      text: 'Welcome to Talk In App',
                  ),
                  buildPageView(
                      image: Constants.onBoardingSecondImage,
                      text: 'Connect with your friends and family',
                  ),
                  buildPageView(
                      image: Constants.onBoardingThirdImage,
                      text: 'Share your thoughts and ideas',
                  ),
                ],
              ),
          ),
          mainSmoothPageIndicator(controller: _pageController),
          verticalSpace(20.h),
          mainElevatedButton(
              context: context,
              isLastPage: isLastPage,
              pageController: _pageController,
          ),
          verticalSpace(20.h),
        ],
      ),
    );
  }
}