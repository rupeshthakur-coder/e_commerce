import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/data/auth/models/user_creation_req.dart';
import 'package:e_commerce/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:e_commerce/presentation/auth/pages/sign_in_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        backgroundColor: null,
        hideBack: false,
        height: 80,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signInText(context),
            20.verticalSpace,
            _firstNameField(context),
            20.verticalSpace,
            _lastNameField(context),
            20.verticalSpace,
            _emailField(context),
            20.verticalSpace,
            _passwordField(context),
            20.verticalSpace,
            _continueButton(context),
            20.verticalSpace,
            _createAccount(context)
          ],
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return Text(
      'Create Account',
      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          hintText: 'Email Address', border: OutlineInputBorder()),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return const TextField(
      decoration:
          InputDecoration(hintText: 'First Name', border: OutlineInputBorder()),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return const TextField(
      decoration:
          InputDecoration(hintText: 'Last Name', border: OutlineInputBorder()),
    );
  }

  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration:
          InputDecoration(hintText: 'Password', border: OutlineInputBorder()),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
            context,
            GenderAndAgeSelectionPage(
                userCreationReq: UserCreationReq(
              firstName: '',
              lastName: '',
              email: '',
              password: '',
            )));
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: "Don't have a account ",
              style: TextStyle(color: AppColors.primary, fontSize: 16.sp)),
          TextSpan(
              text: 'Sign in',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AppNavigator.push(context, const SignInPage());
                },
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontSize: 16.sp)),
        ],
      ),
    );
  }
}
