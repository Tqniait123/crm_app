{{#has_widgets}}
{{#has_search}}
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/colors.dart';
import 'package:{{project_name.snakeCase()}}/core/extensions/context_extensions.dart';

/// Search bar widget for {{feature_name.pascalCase()}} items
/// 
/// This widget provides a modern search interface with suggestions,
/// filtering options, and clear functionality.
class {{feature_name.pascalCase()}}SearchBar extends StatefulWidget {
  /// Text editing controller for the search input
  final TextEditingController controller;
  
  /// Callback when search text changes
  final ValueChanged<String> onChanged;
  
  /// Callback when clear button is pressed
  final VoidCallback? onClear;
  
  /// Placeholder text
  final String hint;
  
  /// Whether to show filter button
  final bool showFilter;
  
  /// Callback when filter button is pressed
  final VoidCallback? onFilter;
  
  /// Whether filters are currently active
  final bool hasActiveFilters;

  /// Constructor for {{feature_name.pascalCase()}}SearchBar
  const {{feature_name.pascalCase()}}SearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onClear,
    this.hint = 'Search...',
    this.showFilter = false,
    this.onFilter,
    this.hasActiveFilters = false,
  });

  @override
  State<{{feature_name.pascalCase()}}SearchBar> createState() => _{{feature_name.pascalCase()}}SearchBarState();
}

class _{{feature_name.pascalCase()}}SearchBarState extends State<{{feature_name.pascalCase()}}SearchBar> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
      child: Row(
        children: [
          // Main search field
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey500,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.grey500,
                ),
                suffixIcon: widget.controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          widget.controller.clear();
                          widget.onClear?.call();
                          _focusNode.unfocus();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: AppColors.grey500,
                        ),
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          
          // Filter button
          if (widget.showFilter) ...[
            Container(
              height: 40,
              width: 1,
              color: AppColors.grey200,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onFilter,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.filter_list,
                        color: widget.hasActiveFilters 
                            ? AppColors.primary 
                            : AppColors.grey500,
                      ),
                      if (widget.hasActiveFilters)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Search suggestions widget
class {{feature_name.pascalCase()}}SearchSuggestions extends StatelessWidget {
  /// List of suggestion strings
  final List<String> suggestions;
  
  /// Callback when a suggestion is selected
  final ValueChanged<String> onSuggestionSelected;
  
  /// Whether to show the suggestions
  final bool isVisible;

  /// Constructor for {{feature_name.pascalCase()}}SearchSuggestions
  const {{feature_name.pascalCase()}}SearchSuggestions({
    super.key,
    required this.suggestions,
    required this.onSuggestionSelected,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible || suggestions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: suggestions.map((suggestion) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onSuggestionSelected(suggestion),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: AppColors.grey400,
                      size: 18,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        suggestion,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.grey700,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.north_west,
                      color: AppColors.grey400,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Quick filter chips widget
class {{feature_name.pascalCase()}}QuickFilters extends StatelessWidget {
  /// List of filter options
  final List<QuickFilter> filters;
  
  /// Currently selected filter
  final String? selectedFilter;
  
  /// Callback when a filter is selected
  final ValueChanged<String?> onFilterSelected;

  /// Constructor for {{feature_name.pascalCase()}}QuickFilters
  const {{feature_name.pascalCase()}}QuickFilters({
    super.key,
    required this.filters,
    this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (filters.isEmpty) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // All filter chip
          _buildFilterChip(
            context,
            label: 'All',
            value: null,
            isSelected: selectedFilter == null,
            onTap: () => onFilterSelected(null),
          ),
          const SizedBox(width: 8),
          
          // Individual filter chips
          ...filters.map((filter) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildFilterChip(
                context,
                label: filter.label,
                value: filter.value,
                count: filter.count,
                isSelected: selectedFilter == filter.value,
                onTap: () => onFilterSelected(filter.value),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context, {
    required String label,
    required String? value,
    int? count,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected 
                ? AppColors.primary 
                : AppColors.grey100,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected 
                  ? AppColors.primary 
                  : AppColors.grey200,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: context.textTheme.bodySmall?.copyWith(
                  color: isSelected 
                      ? AppColors.white 
                      : AppColors.grey700,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (count != null) ...[
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? AppColors.white.withOpacity(0.2) 
                        : AppColors.grey300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      color: isSelected 
                          ? AppColors.white 
                          : AppColors.grey600,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Data class for quick filter options
class QuickFilter {
  final String label;
  final String value;
  final int? count;

  const QuickFilter({
    required this.label,
    required this.value,
    this.count,
  });
}
{{/has_search}}
{{/has_widgets}}
