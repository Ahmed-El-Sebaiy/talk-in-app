import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_in_app/core/helpers/spacing.dart';
import 'package:talk_in_app/core/theming/colors.dart';
import 'package:talk_in_app/core/theming/styles.dart';
import 'package:talk_in_app/core/widgets/app_text_button.dart';
import 'package:talk_in_app/core/widgets/app_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 30.h,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(50),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                verticalSpace(44),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: 'Email',
                      ),
                      verticalSpace(18,),
                      AppTextFormField(
                        hintText: 'Password',
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpace(24,),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(40,),
                      AppTextButton(
                        buttonText: 'Sign In',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: (){},
                      ),
                      verticalSpace(16,),
                      AppTextButton(
                        buttonText: 'Sign Up',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: (){},
                        backgroundColor: ColorsManager.darkBlue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
