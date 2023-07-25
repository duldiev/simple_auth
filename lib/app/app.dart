import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_auth/app/common/constants/app_colors.dart';
import 'package:simple_auth/app/router/app_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_auth/core/utils/injection.dart';

import 'presentation/auth/blocs/auth_bloc/auth_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return CupertinoApp.router(
            theme: CupertinoThemeData(
              primaryColor: AppColors.primary,
              scaffoldBackgroundColor: AppColors.background,
            ),
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
