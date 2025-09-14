// Flutter Widget Implementation
import 'package:crm_app/core/extensions/text_style_extension.dart';
import 'package:crm_app/core/extensions/theme_extension.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAgreementWidget extends StatelessWidget {
  final VoidCallback? onTermsOfServiceTap;
  final VoidCallback? onDataProcessingTap;

  const TermsAgreementWidget({super.key, this.onTermsOfServiceTap, this.onDataProcessingTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: context.bodyMedium.s12.regular,
        children: [
          TextSpan(text: LocaleKeys.by_signing_up_you_agree_to_our.tr()),
          TextSpan(
            text: LocaleKeys.terms_of_service.tr(),
            style: context.bodyMedium.s12.bold.copyWith(color: AppColors.primary),
            recognizer: TapGestureRecognizer()
              ..onTap =
                  onTermsOfServiceTap ??
                  () {
                    // Default action - navigate to terms of service
                    _handleTermsOfServiceTap(context);
                  },
          ),
          TextSpan(text: LocaleKeys.and.tr()),
          TextSpan(
            text: LocaleKeys.data_processing_agreement.tr(),
            style: context.bodyMedium.s12.bold.copyWith(color: AppColors.primary),
            recognizer: TapGestureRecognizer()
              ..onTap =
                  onDataProcessingTap ??
                  () {
                    // Default action - navigate to data processing agreement
                    _handleDataProcessingTap(context);
                  },
          ),
        ],
      ),
    );
  }

  void _handleTermsOfServiceTap(BuildContext context) {}

  void _handleDataProcessingTap(BuildContext context) {}
}

// Usage Example
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Your other signup form widgets here
            const SizedBox(height: 20),

            // Terms Agreement Widget
            TermsAgreementWidget(
              onTermsOfServiceTap: () {
                // Custom action for terms of service
                print('Terms of Service tapped');
              },
              onDataProcessingTap: () {
                // Custom action for data processing agreement
                print('Data Processing Agreement tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Alternative implementation with URL launcher
class TermsAgreementUrlWidget extends StatelessWidget {
  final String? termsOfServiceUrl;
  final String? dataProcessingUrl;

  const TermsAgreementUrlWidget({super.key, this.termsOfServiceUrl, this.dataProcessingUrl});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: context.bodyMedium.s12.regular,
        children: [
          TextSpan(text: LocaleKeys.by_signing_up_you_agree_to_our.tr()),
          TextSpan(
            text: LocaleKeys.terms_of_service.tr(),
            style: context.bodyMedium.s12.bold.copyWith(color: AppColors.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _launchUrl(termsOfServiceUrl ?? 'https://example.com/terms'),
          ),
          TextSpan(text: LocaleKeys.and.tr()),
          TextSpan(
            text: LocaleKeys.data_processing_agreement.tr(),
            style: context.bodyMedium.s12.bold.copyWith(color: AppColors.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _launchUrl(dataProcessingUrl ?? 'https://example.com/privacy'),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    // Add url_launcher package to pubspec.yaml
    // final Uri uri = Uri.parse(url);
    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri);
    // }
    print('Launch URL: $url');
  }
}

// Simplified inline usage
Widget buildTermsAgreement(BuildContext context) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: context.bodyMedium.s12.regular,
      children: [
        TextSpan(text: LocaleKeys.by_signing_up_you_agree_to_our.tr()),
        TextSpan(
          text: LocaleKeys.terms_of_service.tr(),
          style: context.bodyMedium.s12.bold.copyWith(color: AppColors.primary),
          recognizer: TapGestureRecognizer()..onTap = () => print('Terms tapped'),
        ),
        TextSpan(text: LocaleKeys.and.tr()),
        TextSpan(
          text: LocaleKeys.data_processing_agreement.tr(),
          style: context.bodyMedium.s12.bold.copyWith(color: AppColors.primary),
          recognizer: TapGestureRecognizer()..onTap = () => print('Data processing tapped'),
        ),
      ],
    ),
  );
}
