import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:simple_auth/app/common/constants/app_words.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          AppWords.favorites,
        ),
      ),
      child: SafeArea(child: Container()),
    );
  }
}
