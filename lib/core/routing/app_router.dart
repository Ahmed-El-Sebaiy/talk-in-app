import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talk_in_app/core/routing/routes.dart';
import 'package:talk_in_app/features/chat/chat_screen.dart';
import 'package:talk_in_app/features/signin/logic/cubit/auth_cubit.dart';
import 'package:talk_in_app/features/signin/ui/signin_screen.dart';
import 'package:talk_in_app/features/signup/ui/signup_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => AuthCubit(),
                child: SignInScreen(),
              ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routes.chatScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ChatScreen(email: email),

        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}