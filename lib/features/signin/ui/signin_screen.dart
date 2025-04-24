import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_in_app/core/helpers/spacing.dart';
import 'package:talk_in_app/core/routing/routes.dart';
import 'package:talk_in_app/core/theming/colors.dart';
import 'package:talk_in_app/core/theming/styles.dart';
import 'package:talk_in_app/core/widgets/app_text_button.dart';
import 'package:talk_in_app/core/widgets/app_text_form_field.dart';
import 'package:talk_in_app/features/signin/logic/cubit/auth_cubit.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  SignInScreen({super.key});

  //bool isObscureText = true;

  final AuthCubit authCubit = AuthCubit();

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 30.h,
          ),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState ){
                String emailUser = emailController.text;
                print(emailUser);
                Navigator.pushReplacementNamed(
                  context,
                  Routes.chatScreen,
                  arguments: emailUser,
                );
              } else if (state is AuthErrorState){
                print('Error: ${state.error.toString()}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error.toString()),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (state is AuthLoadingState){
                Center(child: CircularProgressIndicator(),);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(90),
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
                            controller: emailController,
                            hintText: 'Email',
                          ),
                          verticalSpace(18,),
                          AppTextFormField(
                            controller: passwordController,
                            hintText: 'Password',
                            isObscureText: state.isPasswordHidden,
                            suffixIcon: IconButton(
                              onPressed: (){
                                context.read<AuthCubit>().togglePasswordVisibility();
                              },
                              icon: Icon(
                                state.isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                          verticalSpace(24,),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Can\'t remember? ',
                                    style: TextStyles.font14DarkBlueMedium,
                                  ),
                                  TextSpan(
                                    text: 'Forget password?',
                                    style: TextStyles.font13BlueRegular,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Forget password tapped');
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          verticalSpace(40,),
                          state is AuthLoadingState ? CircularProgressIndicator()
                              : AppTextButton(
                            buttonText: 'Sign In',
                            textStyle: TextStyles.font16WhiteSemiBold,
                            onPressed: () async {
                              context.read<AuthCubit>().signIn(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                              //   if (formKey.currentState!.validate() && state is AuthSuccessSignInState) {
                              //     try {
                              //       await context.read<AuthCubit>().signIn(
                              //         email: emailController.text,
                              //         password: passwordController.text,
                              //       );
                              //       Navigator.pushNamed(
                              //         context,
                              //         Routes.homeScreen,
                              //         arguments: email,
                              //       );
                              //     } on FirebaseAuthException catch (err){
                              //       if (err.code == 'user-not-found') {
                              //         ScaffoldMessenger.of(context).showSnackBar(
                              //           SnackBar(
                              //             content: Text('No user found for that email.'),
                              //             backgroundColor: Colors.red,
                              //           ),
                              //         );
                              //       } else if (err.code == 'wrong-password') {
                              //         ScaffoldMessenger.of(context).showSnackBar(
                              //           SnackBar(
                              //             content: Text('Wrong password provided for that user.'),
                              //             backgroundColor: Colors.red,
                              //           ),
                              //         );
                              //       }
                              //     } catch (err) {
                              //       print('Error: $err');
                              //     }
                              //   }
                            },
                          ),
                          verticalSpace(16,),
                          state is AuthLoadingState ? CircularProgressIndicator()
                              : AppTextButton(
                            buttonText: 'Sign Up',
                            textStyle: TextStyles.font16WhiteSemiBold,
                            onPressed: () async{
                              context.read<AuthCubit>().signUp(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                              // if (formKey.currentState!.validate() && state is AuthSuccessState) {
                              //   try {
                              //     await context.read<AuthCubit>().signUp(
                              //       email: emailController.text,
                              //       password: passwordController.text,
                              //     );
                              //     Navigator.pushNamed(
                              //       context,
                              //       Routes.homeScreen,
                              //     );
                              //   } on FirebaseAuthException catch (err){
                              //     if (err.code == 'weak-password') {
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //         SnackBar(
                              //           content: Text('The password provided is too weak.'),
                              //           backgroundColor: Colors.red,
                              //         ),
                              //       );
                              //     } else if (err.code == 'email-already-in-use') {
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //         SnackBar(
                              //           content: Text('The account already exists for that email.'),
                              //           backgroundColor: Colors.red,
                              //         ),
                              //       );
                              //     }
                              //   } catch (err) {
                              //     print('Error: $err');
                              //   }
                              //}
                            },
                            backgroundColor: ColorsManager.darkBlue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}