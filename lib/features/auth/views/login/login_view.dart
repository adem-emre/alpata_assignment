import 'package:alpata_assignment/const/app_assets.dart';
import 'package:alpata_assignment/const/app_dimensions.dart';
import 'package:alpata_assignment/const/app_strings.dart';
import 'package:alpata_assignment/core/extensions/size_extension.dart';
import 'package:alpata_assignment/core/extensions/validation_extension.dart';
import 'package:alpata_assignment/features/auth/views/login/login_notifier.dart';
import 'package:alpata_assignment/router/router.gr.dart';
import 'package:alpata_assignment/widgets/custom_button.dart';
import 'package:alpata_assignment/widgets/custom_text_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
   LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginNotifier(),
      child: Scaffold(
        body: Builder(builder: (context) {
          return SizedBox(
            width: context.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.horizontalPagePadding),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: context.setScaledHeight(0.15)),
                      child: Image.asset(AppAssets.appLogo),
                    ),
                    SizedBox(
                      height: context.setScaledHeight(0.12),
                    ),
                    CustomTextForm(
                      prefixIcon: const Icon(Icons.mail),
                      hintText: AppStrings.mailStr,
                      validator: context.validateIsEmpty,
                      onSaved: (value) {
                        context.read<LoginNotifier>().userMail = value!;
                      },
                    ),
                    CustomTextForm(
                        passwordMode: true,
                        prefixIcon: const Icon(Icons.lock),
                        hintText: AppStrings.passwordStr,
                        validator: context.validateIsEmpty,
                        onSaved: (value) {
                          context.read<LoginNotifier>().password = value!;
                        }),
                    CustomButton(
                      label: "Giriş Yap",
                      onFuture: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final loginNotifier = context.read<LoginNotifier>();
                          bool success =
                              await loginNotifier.login();

                          if (success) {
                            context.router
                                .replace(const StockMarketHomeViewRoute());
                          } else {
                            Fluttertoast.showToast(
                                msg: loginNotifier.errorStr!);
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
