import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_auth/app/common/constants/app_colors.dart';
import 'package:simple_auth/app/common/constants/app_words.dart';
import 'package:simple_auth/app/common/widgets/buttons/cupertino_button_filled.dart';
import 'package:simple_auth/app/common/widgets/inputs/cupertino_input_field.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Auth'),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: AppColors.white,
            child: Column(
              children: [
                CupertinoInputField(
                  placeholder: AppWords.loginOrEmail,
                ),
                Divider(
                  indent: 4.w,
                  endIndent: 4.w,
                  height: 0,
                ),
                CupertinoInputField(
                  placeholder: AppWords.password,
                ),
              ],
            ),
          ),
          Gap(4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CupertinoButtonFilled(
                  buttonTitle: AppWords.signIn,
                  onPressed: () {},
                ),
                Gap(2.h),
                CupertinoButtonFilled(
                  buttonTitle: AppWords.signUp,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
