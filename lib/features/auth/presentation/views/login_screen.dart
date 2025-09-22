import 'package:crm_app/config/routes/routes.dart';
import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/text_style_extension.dart';
import 'package:crm_app/core/extensions/theme_extension.dart';
import 'package:crm_app/core/extensions/widget_extensions.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:crm_app/core/utils/widgets/inputs/custom_form_field.dart';
import 'package:crm_app/core/utils/widgets/logo_widget.dart';
import 'package:crm_app/core/widgets/custom_scaffold.dart';
import 'package:crm_app/features/auth/presentation/widgets/sign_up_button.dart';
import 'package:crm_app/features/auth/presentation/widgets/social_media_buttons.dart';
import 'package:crm_app/features/auth/presentation/widgets/terms_agreement_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isRemembered = false;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoWidget(type: LogoType.wide, size: 150),
            16.gap,
            Text(
              LocaleKeys.sign_in_to_your_account.tr(),
              style: context.titleLarge.bold.s32.copyWith(color: AppColors.black),
            ),
            16.gap,
            SignUpButton(isLogin: true),
            35.gap,
            CustomTextFormField(
              controller: emailController,
              title: LocaleKeys.email.tr(),
              margin: 0,
              hint: LocaleKeys.email.tr(),
              isRequired: true,
            ),
            16.gap,
            CustomTextFormField(
              title: LocaleKeys.password.tr(),
              margin: 0,
              hint: LocaleKeys.password.tr(),
              isPassword: true,
              isRequired: true,
              controller: passwordController,
            ),
            16.gap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        activeColor: AppColors.primary,
                        checkColor: AppColors.white,
                        value: isRemembered,
                        onChanged: (value) async {
                          final newValue = value ?? false;
                          setState(() {
                            isRemembered = newValue;
                          });
                        },
                      ),
                    ),
                    8.gap,
                    Text(LocaleKeys.remember_me.tr(), style: context.bodyMedium.s12.regular),
                  ],
                ),
                GestureDetector(
                  onTap: () => context.push(Routes.forgetPassword),
                  child: Text(
                    LocaleKeys.forgot_password.tr(),
                    style: context.bodyMedium.s12.bold.copyWith(color: AppColors.primary),
                  ),
                ),
              ],
            ),
            16.gap,
            // OR login with
            Row(
              children: [
                Expanded(child: Divider(color: AppColors.borderColor, thickness: 1)),
                16.gap,
                Text(LocaleKeys.or_login_with.tr(), style: context.bodyMedium.s14.regular),
                16.gap,
                Expanded(child: Divider(color: AppColors.borderColor, thickness: 1)),
              ],
            ),
            16.gap,
            SocialMediaButtons(),
            32.gap,
            CustomElevatedButton(
              title: LocaleKeys.login.tr(),
              onPressed: () {
                context.push(Routes.layout);
              },
            ),
            32.gap,
            TermsAgreementWidget(),
          ],
        ).paddingSymmetric(20, 0),
      ),
    );
  }
}
