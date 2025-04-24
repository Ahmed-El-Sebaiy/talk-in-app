import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TalkInApp(
    appRouter: AppRouter(),
  ));
}

class TalkInApp extends StatelessWidget {
  final AppRouter appRouter;
  TalkInApp({super.key, required this.appRouter,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}