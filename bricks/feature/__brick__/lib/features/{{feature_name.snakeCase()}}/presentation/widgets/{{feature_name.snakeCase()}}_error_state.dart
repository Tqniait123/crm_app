{{#has_widgets}}
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/colors.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:{{project_name.snakeCase()}}/core/extensions/sized_box.dart';
import 'package:{{project_name.snakeCase()}}/core/extensions/context_extensions.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/app_error.dart';

/// Error state widget for {{feature_name.pascalCase()}} operations
/// 
/// This widget displays error states with appropriate messaging
/// and recovery actions based on the error type.
class {{feature_name.pascalCase()}}ErrorState extends StatelessWidget {
  /// The error to display
  final AppError error;
  
  /// Callback for retry action
  final VoidCallback? onRetry;
  
  /// Callback for alternative action
  final VoidCallback? onAlternativeAction;
  
  /// Alternative action button text
  final String? alternativeActionText;
  
  /// Whether to show detailed error information
  final bool showDetails;
  
  /// Custom title override
  final String? title;
  
  /// Custom description override
  final String? description;

  /// Constructor for {{feature_name.pascalCase()}}ErrorState
  const {{feature_name.pascalCase()}}ErrorState({
    super.key,
    required this.error,
    this.onRetry,
    this.onAlternativeAction,
    this.alternativeActionText,
    this.showDetails = false,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error illustration
            _buildErrorIllustration(),
            
            24.ph,
            
            // Error title
            Text(
              title ?? _getErrorTitle(),
              style: context.textTheme.headlineMedium?.copyWith(
                color: AppColors.grey800,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            
            12.ph,
            
            // Error description
            Text(
              description ?? _getErrorDescription(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.grey600,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            
            // Detailed error information
            if (showDetails && error.message.isNotEmpty) ...[
              16.ph,
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.error.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.error.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: AppColors.error,
                      size: 16,
                    ),
                    8.pw,
                    Expanded(
                      child: Text(
                        error.message,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.error,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            
            32.ph,
            
            // Action buttons
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorIllustration() {
    IconData icon;
    Color color;
    
    switch (error.type) {
      case ErrorType.network:
        icon = Icons.wifi_off;
        color = AppColors.warning;
        break;
      case ErrorType.timeout:
        icon = Icons.hourglass_empty;
        color = AppColors.warning;
        break;
      case ErrorType.unauthorized:
        icon = Icons.lock_outline;
        color = AppColors.error;
        break;
      case ErrorType.forbidden:
        icon = Icons.block;
        color = AppColors.error;
        break;
      case ErrorType.notFound:
        icon = Icons.search_off;
        color = AppColors.grey500;
        break;
      case ErrorType.validation:
        icon = Icons.warning_outlined;
        color = AppColors.warning;
        break;
      case ErrorType.server:
        icon = Icons.dns_outlined;
        color = AppColors.error;
        break;
      case ErrorType.api:
      case ErrorType.unknown:
      default:
        icon = Icons.error_outline;
        color = AppColors.error;
    }

    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.grey100,
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
          // Main icon
          Icon(
            icon,
            size: 48,
            color: color.withOpacity(0.8),
          ),
        ],
      ),
    );
  }

  String _getErrorTitle() {
    switch (error.type) {
      case ErrorType.network:
        return 'No Internet Connection';
      case ErrorType.timeout:
        return 'Request Timeout';
      case ErrorType.unauthorized:
        return 'Authentication Required';
      case ErrorType.forbidden:
        return 'Access Denied';
      case ErrorType.notFound:
        return 'Not Found';
      case ErrorType.validation:
        return 'Invalid Data';
      case ErrorType.server:
        return 'Server Error';
      case ErrorType.api:
        return 'Service Unavailable';
      case ErrorType.unknown:
      default:
        return 'Something Went Wrong';
    }
  }

  String _getErrorDescription() {
    switch (error.type) {
      case ErrorType.network:
        return 'Please check your internet connection and try again.';
      case ErrorType.timeout:
        return 'The request took too long to complete. Please try again.';
      case ErrorType.unauthorized:
        return 'You need to log in to access this content.';
      case ErrorType.forbidden:
        return 'You don\'t have permission to access this content.';
      case ErrorType.notFound:
        return 'The requested {{feature_name.snakeCase()}} items could not be found.';
      case ErrorType.validation:
        return 'Please check your input and try again.';
      case ErrorType.server:
        return 'Our servers are currently experiencing issues. Please try again later.';
      case ErrorType.api:
        return 'We\'re having trouble loading {{feature_name.snakeCase()}} data right now.';
      case ErrorType.unknown:
      default:
        return 'An unexpected error occurred. Please try again or contact support if the problem persists.';
    }
  }

  Widget _buildActionButtons(BuildContext context) {
    final List<Widget> buttons = [];

    // Primary action (usually retry)
    if (onRetry != null) {
      buttons.add(
        CustomElevatedButton(
          title: 'Try Again',
          onPressed: onRetry,
          icon: Icons.refresh,
          iconPosition: IconPosition.start,
        ),
      );
    }

    // Alternative action
    if (onAlternativeAction != null && alternativeActionText != null) {
      if (buttons.isNotEmpty) buttons.add(12.ph);
      
      buttons.add(
        CustomElevatedButton(
          title: alternativeActionText!,
          onPressed: onAlternativeAction,
          backgroundColor: AppColors.grey100,
          textColor: AppColors.grey700,
          isFilled: false,
        ),
      );
    }

    // Default actions based on error type
    if (buttons.isEmpty) {
      switch (error.type) {
        case ErrorType.network:
          buttons.add(
            CustomElevatedButton(
              title: 'Check Connection',
              onPressed: onRetry ?? () {},
              icon: Icons.wifi,
              iconPosition: IconPosition.start,
            ),
          );
          break;
        case ErrorType.unauthorized:
          buttons.add(
            CustomElevatedButton(
              title: 'Sign In',
              onPressed: onAlternativeAction ?? () {},
              icon: Icons.login,
              iconPosition: IconPosition.start,
            ),
          );
          break;
        default:
          if (onRetry != null) {
            buttons.add(
              CustomElevatedButton(
                title: 'Retry',
                onPressed: onRetry,
                icon: Icons.refresh,
                iconPosition: IconPosition.start,
              ),
            );
          }
      }
    }

    return Column(children: buttons);
  }
}

/// Compact error widget for smaller spaces
class {{feature_name.pascalCase()}}CompactErrorState extends StatelessWidget {
  final AppError error;
  final VoidCallback? onRetry;

  const {{feature_name.pascalCase()}}CompactErrorState({
    super.key,
    required this.error,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.error.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: AppColors.error,
            size: 24,
          ),
          12.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Error Loading Data',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.error,
                  ),
                ),
                4.ph,
                Text(
                  error.message.isNotEmpty 
                      ? error.message 
                      : 'Something went wrong',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.grey600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (onRetry != null) ...[
            12.pw,
            TextButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }
}

/// Banner error widget for top of screen
class {{feature_name.pascalCase()}}ErrorBanner extends StatelessWidget {
  final AppError error;
  final VoidCallback? onDismiss;
  final VoidCallback? onRetry;

  const {{feature_name.pascalCase()}}ErrorBanner({
    super.key,
    required this.error,
    this.onDismiss,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.error,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColors.white,
              size: 20,
            ),
            12.pw,
            Expanded(
              child: Text(
                error.message.isNotEmpty 
                    ? error.message 
                    : 'An error occurred',
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (onRetry != null)
              TextButton(
                onPressed: onRetry,
                child: Text(
                  'Retry',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            if (onDismiss != null)
              IconButton(
                onPressed: onDismiss,
                icon: const Icon(
                  Icons.close,
                  color: AppColors.white,
                  size: 18,
                ),
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
                padding: EdgeInsets.zero,
              ),
          ],
        ),
      ),
    );
  }
}
{{/has_widgets}}
