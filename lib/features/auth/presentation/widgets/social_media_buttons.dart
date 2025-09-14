import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:crm_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (BuildContext context, AuthState state) => CustomElevatedButton(
              // loading: state is AuthLoading,
              heroTag: 'google',
              height: 48,
              icon: AppIcons.google,
              iconColor: null,
              textColor: AppColors.black,
              isBordered: true,
              backgroundColor: AppColors.white,
              withDoubleBorder: false,
              title: LocaleKeys.google.tr(),
              onPressed: () {
                context.read<AuthCubit>().loginWithGoogle();
              },
            ),
          ),
        ),
        15.gap,
        Expanded(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (BuildContext context, AuthState state) => CustomElevatedButton(
              // loading: state is AuthLoading,
              heroTag: 'facebook',
              height: 48,
              icon: AppIcons.facebook,
              iconColor: null,
              textColor: AppColors.black,
              withDoubleBorder: false,
              isBordered: true,
              backgroundColor: AppColors.white,
              title: LocaleKeys.facebook.tr(),
              onPressed: () {
                // context.read<AuthCubit>().loginWithfacebook();
              },
            ),
          ),
        ),
      ],
    );
  }
}
