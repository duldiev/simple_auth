// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_auth/app/common/constants/app_colors.dart';
import 'package:simple_auth/app/common/constants/app_words.dart';
import 'package:simple_auth/app/common/widgets/buttons/cupertino_button.dart';
import 'package:simple_auth/app/presentation/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:simple_auth/app/router/app_router.gr.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (!state.authorized) {
          context.router.replace(const AuthRoute());
        }
      },
      builder: (context, state) {
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
                  state.data?.user.nickname ?? '-',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(1.h),
                Text(
                  state.data?.user.email ?? '-',
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
                    onPressed: () => context.read<AuthBloc>().add(
                          const SignOut(),
                        ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
