{{#has_widgets}}
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/colors.dart';
import 'package:{{project_name.snakeCase()}}/core/extensions/sized_box.dart';
import 'package:{{project_name.snakeCase()}}/core/extensions/context_extensions.dart';
{{#has_models}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/models/{{feature_name.snakeCase()}}_model.dart';
{{/has_models}}

/// List item widget for displaying {{feature_name.pascalCase()}} items
/// 
/// This widget provides a consistent and interactive list item design
/// for {{feature_name.snakeCase()}} items with actions and status indicators.
class {{feature_name.pascalCase()}}ListItem extends StatelessWidget {
  /// The {{feature_name.snakeCase()}} item to display
  final {{feature_name.pascalCase()}}Model item;
  
  /// Callback when the item is tapped
  final VoidCallback? onTap;
  
  /// Callback when the edit action is triggered
  final VoidCallback? onEdit;
  
  /// Callback when the delete action is triggered
  final VoidCallback? onDelete;
  
  /// Whether the item is currently loading (e.g., being deleted)
  final bool isLoading;
  
  /// Whether to show action buttons
  final bool showActions;
  
  /// Custom leading widget
  final Widget? leading;
  
  /// Custom trailing widget
  final Widget? trailing;

  /// Constructor for {{feature_name.pascalCase()}}ListItem
  const {{feature_name.pascalCase()}}ListItem({
    super.key,
    required this.item,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.isLoading = false,
    this.showActions = true,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Leading widget or status indicator
                if (leading != null)
                  leading!
                else
                  _buildStatusIndicator(),
                
                16.pw,
                
                // Main content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and status badge
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.displayName,
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey800,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (item.status != null) ...[
                            8.pw,
                            _buildStatusBadge(),
                          ],
                        ],
                      ),
                      
                      // Description if available
                      if (item.description != null && item.description!.isNotEmpty) ...[
                        4.ph,
                        Text(
                          item.description!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.grey600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      
                      // Meta information
                      8.ph,
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: AppColors.grey500,
                          ),
                          4.pw,
                          Text(
                            item.timeSinceCreation,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: AppColors.grey500,
                              fontSize: 12,
                            ),
                          ),
                          if (item.isRecentlyCreated) ...[
                            8.pw,
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.success.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'New',
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: AppColors.success,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Trailing widget or actions
                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                else if (trailing != null)
                  trailing!
                else if (showActions)
                  _buildActions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIndicator() {
    Color color;
    IconData icon;
    
    if (!item.isActive) {
      color = AppColors.grey400;
      icon = Icons.pause_circle_outline;
    } else {
      switch (item.status?.toLowerCase()) {
        case 'active':
          color = AppColors.success;
          icon = Icons.check_circle_outline;
          break;
        case 'pending':
          color = AppColors.warning;
          icon = Icons.schedule;
          break;
        case 'inactive':
          color = AppColors.error;
          icon = Icons.cancel_outlined;
          break;
        default:
          color = AppColors.grey400;
          icon = Icons.help_outline;
      }
    }
    
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color,
        size: 20,
      ),
    );
  }

  Widget _buildStatusBadge() {
    if (item.status == null) return const SizedBox.shrink();
    
    Color backgroundColor;
    Color textColor;
    
    switch (item.status!.toLowerCase()) {
      case 'active':
        backgroundColor = AppColors.success.withOpacity(0.1);
        textColor = AppColors.success;
        break;
      case 'pending':
        backgroundColor = AppColors.warning.withOpacity(0.1);
        textColor = AppColors.warning;
        break;
      case 'inactive':
        backgroundColor = AppColors.error.withOpacity(0.1);
        textColor = AppColors.error;
        break;
      default:
        backgroundColor = AppColors.grey200;
        textColor = AppColors.grey600;
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        item.status!.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: AppColors.grey600),
      onSelected: (value) {
        switch (value) {
          case 'edit':
            onEdit?.call();
            break;
          case 'delete':
            onDelete?.call();
            break;
        }
      },
      itemBuilder: (context) => [
        if (onEdit != null)
          const PopupMenuItem(
            value: 'edit',
            child: Row(
              children: [
                Icon(Icons.edit_outlined, size: 18, color: AppColors.grey600),
                SizedBox(width: 8),
                Text('Edit'),
              ],
            ),
          ),
        if (onDelete != null)
          const PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                Icon(Icons.delete_outline, size: 18, color: AppColors.error),
                SizedBox(width: 8),
                Text('Delete', style: TextStyle(color: AppColors.error)),
              ],
            ),
          ),
      ],
    );
  }
}

/// Compact version of {{feature_name.pascalCase()}}ListItem for smaller spaces
class {{feature_name.pascalCase()}}ListItemCompact extends StatelessWidget {
  final {{feature_name.pascalCase()}}Model item;
  final VoidCallback? onTap;
  final bool isSelected;

  const {{feature_name.pascalCase()}}ListItemCompact({
    super.key,
    required this.item,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: isSelected 
            ? AppColors.primary.withOpacity(0.1) 
            : AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected 
              ? AppColors.primary.withOpacity(0.3) 
              : AppColors.grey200,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.isActive 
                        ? AppColors.success 
                        : AppColors.grey400,
                  ),
                ),
                12.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.displayName,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: isSelected 
                              ? AppColors.primary 
                              : AppColors.grey800,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (item.description != null && item.description!.isNotEmpty) ...[
                        2.ph,
                        Text(
                          item.description!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.grey600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                if (isSelected)
                  const Icon(
                    Icons.check,
                    color: AppColors.primary,
                    size: 18,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
{{/has_widgets}}
