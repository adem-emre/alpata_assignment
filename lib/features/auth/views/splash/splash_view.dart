import 'package:alpata_assignment/const/app_assets.dart';
import 'package:alpata_assignment/const/app_colors.dart';
import 'package:alpata_assignment/core/auth/auth_manager.dart';
import 'package:alpata_assignment/core/extensions/size_extension.dart';
import 'package:alpata_assignment/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> navigateUser() async {
    bool isUserLoggedIn = await AuthManager.getToken();
    if (isUserLoggedIn) {
      context.router.replace(const StockMarketHomeViewRoute());
    } else {
      context.router.replace( LoginViewRoute());
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      navigateUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors.splashBgColor,
      width: context.width,
      height: context.height,
      child: Image.asset(AppAssets.logo),
    ));
  }
}
