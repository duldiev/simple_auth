import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_auth/app/common/constants/app_colors.dart';
import 'package:simple_auth/app/common/constants/app_words.dart';
import 'package:simple_auth/app/common/widgets/buttons/cupertino_button_filled.dart';
import 'package:simple_auth/app/common/widgets/inputs/cupertino_input_field.dart';
import 'package:simple_auth/app/presentation/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:simple_auth/app/router/app_router.gr.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppWords.auth),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: AppColors.white,
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (authContext, state) {
                if (state.failed) {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text(state.message),
                      content: null,
                      actions: [
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () {
                            context.router.pop();
                            authContext.read<AuthBloc>().add(
                                  const Reset(),
                                );
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  );
                }
                if (state.authorized) {
                  context.router.replace(const NavRouter());
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    CupertinoInputField(
                      initialValue: state.email,
                      placeholder: AppWords.loginOrEmail,
                      onChanged: (value) => context.read<AuthBloc>().add(
                            EmailChanged(value),
                          ),
                    ),
                    Divider(
                      indent: 4.w,
                      endIndent: 4.w,
                      height: 0,
                    ),
                    CupertinoInputField(
                      initialValue: state.password,
                      placeholder: AppWords.password,
                      onChanged: (value) => context.read<AuthBloc>().add(
                            PasswordChanged(value),
                          ),
                    ),
                  ],
                );
              },
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
                  onPressed: () => context.read<AuthBloc>().add(
                        const SignIn(),
                      ),
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
