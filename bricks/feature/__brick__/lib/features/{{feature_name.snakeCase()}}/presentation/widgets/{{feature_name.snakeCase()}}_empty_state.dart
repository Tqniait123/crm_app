{{#has_widgets}}
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/colors.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:{{project_name.snakeCase()}}/core/extensions/sized_box.dart';
import 'package:{{project_name.snakeCase()}}/core/extensions/context_extensions.dart';

/// Empty state widget for {{feature_name.pascalCase()}} list
/// 
/// This widget displays when there are no {{feature_name.snakeCase()}} items to show,
/// providing appropriate messaging and actions based on the context.
class {{feature_name.pascalCase()}}EmptyState extends StatelessWidget {
  /// Whether there's an active search
  final bool hasActiveSearch;
  
  /// Current search query
  final String? searchQuery;
  
  /// Callback to clear search
  final VoidCallback? onClearSearch;
  
  /// Callback to create new item
  final VoidCallback? onCreateNew;
  
  /// Custom title text
  final String? title;
  
  /// Custom description text
  final String? description;
  
  /// Custom illustration widget
  final Widget? illustration;

  /// Constructor for {{feature_name.pascalCase()}}EmptyState
  const {{feature_name.pascalCase()}}EmptyState({
    super.key,
    this.hasActiveSearch = false,
    this.searchQuery,
    this.onClearSearch,
    this.onCreateNew,
    this.title,
    this.description,
    this.illustration,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration
            illustration ?? _buildDefaultIllustration(),
            
            24.ph,
            
            // Title
            Text(
              title ?? _getTitle(),
              style: context.textTheme.headlineMedium?.copyWith(
                color: AppColors.grey800,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            
            12.ph,
            
            // Description
            Text(
              description ?? _getDescription(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.grey600,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            
            32.ph,
            
            // Action buttons
            if (hasActiveSearch && onClearSearch != null)
              CustomElevatedButton(
                title: 'Clear Search',
                onPressed: onClearSearch,
                backgroundColor: AppColors.grey100,
                textColor: AppColors.grey700,
                isFilled: false,
              )
            else if (onCreateNew != null)
              CustomElevatedButton(
                title: 'Create First {{feature_name.pascalCase()}}',
                onPressed: onCreateNew,
                icon: Icons.add,
                iconPosition: IconPosition.start,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultIllustration() {
    if (hasActiveSearch) {
      return _SearchEmptyIllustration();
    } else {
      return _DefaultEmptyIllustration();
    }
  }

  String _getTitle() {
    if (hasActiveSearch) {
      return 'No Results Found';
    } else {
      return 'No {{feature_name.pascalCase()}} Items Yet';
    }
  }

  String _getDescription() {
    if (hasActiveSearch) {
      return searchQuery != null
          ? 'We couldn\'t find any {{feature_name.snakeCase()}} items matching "$searchQuery". Try adjusting your search terms.'
          : 'We couldn\'t find any {{feature_name.snakeCase()}} items matching your search criteria.';
    } else {
      return 'You haven\'t created any {{feature_name.snakeCase()}} items yet. Create your first one to get started.';
    }
  }
}

/// Default empty state illustration
class _DefaultEmptyIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          // Background circles
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
          // Main icon
          Icon(
            Icons.folder_outlined,
            size: 48,
            color: AppColors.primary.withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}

/// Search empty state illustration
class _SearchEmptyIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          // Background circles
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.warning.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
          // Main icon
          Icon(
            Icons.search_off,
            size: 48,
            color: AppColors.warning.withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}

/// Loading empty state for initial load
class {{feature_name.pascalCase()}}LoadingEmptyState extends StatelessWidget {
  /// Custom message
  final String? message;

  /// Constructor for {{feature_name.pascalCase()}}LoadingEmptyState
  const {{feature_name.pascalCase()}}LoadingEmptyState({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Loading indicator
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.grey100,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ),
          
          24.ph,
          
          // Loading message
          Text(
            message ?? 'Loading {{feature_name.snakeCase()}} items...',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.grey600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Quick actions widget for empty state
class {{feature_name.pascalCase()}}QuickActions extends StatelessWidget {
  /// List of quick actions
  final List<QuickAction> actions;

  /// Constructor for {{feature_name.pascalCase()}}QuickActions
  const {{feature_name.pascalCase()}}QuickActions({
    super.key,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    if (actions.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        Text(
          'Quick Actions',
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.grey700,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        16.ph,
        
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: actions.map((action) {
            return _QuickActionCard(action: action);
          }).toList(),
        ),
      ],
    );
  }
}

/// Quick action card widget
class _QuickActionCard extends StatelessWidget {
  final QuickAction action;

  const _QuickActionCard({required this.action});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: action.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey200),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: action.color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  action.icon,
                  color: action.color,
                  size: 24,
                ),
              ),
              
              8.ph,
              
              Text(
                action.title,
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey800,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Data class for quick actions
class QuickAction {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const QuickAction({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}
{{/has_widgets}}
