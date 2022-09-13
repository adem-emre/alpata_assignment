import 'package:alpata_assignment/const/app_assets.dart';
import 'package:alpata_assignment/const/app_dimensions.dart';
import 'package:alpata_assignment/const/app_strings.dart';
import 'package:alpata_assignment/core/extensions/size_extension.dart';
import 'package:alpata_assignment/widgets/custom_button.dart';
import 'package:alpata_assignment/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.horizontalPagePadding),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: context.setScaledHeight(0.15)),
                child: Image.asset(AppAssets.appLogo),
              ),
              SizedBox(
                height: context.setScaledHeight(0.12),
              ),
              const CustomTextForm(
                  prefixIcon: Icon(Icons.mail), hintText: AppStrings.mailStr),
              const CustomTextForm(
                  passwordMode: true,
                  prefixIcon: Icon(Icons.lock),
                  hintText: AppStrings.passwordStr),
              const CustomButton(label: "Giriş Yap")
            ],
          ),
        ),
      ),
    );
  }
}
