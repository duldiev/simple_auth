// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_auth/app/common/constants/app_colors.dart';
import 'package:simple_auth/app/common/constants/app_words.dart';
import 'package:simple_auth/app/common/widgets/buttons/cupertino_button.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          AppWords.profile,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(3.h),
            SvgPicture.asset(
              'assets/icons/profile.svg',
              height: 10.h,
              color: AppColors.black,
            ),
            Gap(2.h),
            Text(
              'Nick name',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(1.h),
            Text(
              '@email',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: AppColors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(3.h),
            Container(
              color: AppColors.white,
              child: CupertinoButtonDefault(
                buttonTitle: AppWords.signOut,
                alignment: Alignment.centerLeft,
                titleColor: AppColors.danger,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
