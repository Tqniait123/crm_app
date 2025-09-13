import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/core/services/di.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/colors.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/widgets/loading/loading_widget.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/widgets/scaffold/custom_scaffold.dart';
import 'package:{{project_name.snakeCase()}}/core/extensions/sized_box.dart';
import 'package:{{project_name.snakeCase()}}/core/extensions/context_extensions.dart';
{{#has_cubit}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/cubit/{{feature_name.snakeCase()}}_cubit.dart';
{{/has_cubit}}
{{#has_models}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/data/models/{{feature_name.snakeCase()}}_model.dart';
{{/has_models}}
{{#has_widgets}}
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/widgets/{{feature_name.snakeCase()}}_list_item.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/widgets/{{feature_name.snakeCase()}}_search_bar.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/widgets/{{feature_name.snakeCase()}}_empty_state.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/presentation/widgets/{{feature_name.snakeCase()}}_error_state.dart';
{{/has_widgets}}

/// {{feature_name.pascalCase()}} page displaying the list and management interface
/// 
/// This page provides a comprehensive interface for managing {{feature_name.snakeCase()}} items
/// including listing, searching, creating, updating, and deleting operations.
class {{feature_name.pascalCase()}}Page extends StatefulWidget {
  /// Constructor for {{feature_name.pascalCase()}}Page
  const {{feature_name.pascalCase()}}Page({super.key});

  @override
  State<{{feature_name.pascalCase()}}Page> createState() => _{{feature_name.pascalCase()}}PageState();
}

class _{{feature_name.pascalCase()}}PageState extends State<{{feature_name.pascalCase()}}Page> {
  late final {{feature_name.pascalCase()}}Cubit _cubit;
  late final ScrollController _scrollController;
  {{#has_search}}
  late final TextEditingController _searchController;
  {{/has_search}}

  @override
  void initState() {
    super.initState();
    _cubit = sl<{{feature_name.pascalCase()}}Cubit>();
    _scrollController = ScrollController();
    {{#has_search}}
    _searchController = TextEditingController();
    {{/has_search}}
    
    {{#has_pagination}}
    // Add scroll listener for pagination
    _scrollController.addListener(_onScroll);
    {{/has_pagination}}
    
    // Load initial data
    _cubit.load{{feature_name.pascalCase()}}List(refresh: true);
  }

  @override
  void dispose() {
    _cubit.close();
    _scrollController.dispose();
    {{#has_search}}
    _searchController.dispose();
    {{/has_search}}
    super.dispose();
  }

  {{#has_pagination}}
  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent * 0.8) {
      _cubit.loadMore();
    }
  }
  {{/has_pagination}}

  {{#has_search}}
  void _onSearchChanged(String query) {
    _cubit.search{{feature_name.pascalCase()}}(query);
  }

  void _clearSearch() {
    _searchController.clear();
    _cubit.clearSearch();
  }
  {{/has_search}}

  void _onRefresh() {
    _cubit.refresh();
  }

  {{#crud_operations}}
  {{#equals this "create"}}
  void _navigateToCreate() {
    // Navigate to create page
    // Navigator.of(context).pushNamed('/{{feature_name.snakeCase()}}/create');
    // Or show bottom sheet/dialog for creation
    _showCreateDialog();
  }

  void _showCreateDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: context.height * 0.7,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.grey300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Create {{feature_name.pascalCase()}}',
                style: context.textTheme.titleLarge,
              ),
            ),
            // Add your create form here
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Add form fields here
                    const Spacer(),
                    CustomElevatedButton(
                      title: 'Create',
                      onPressed: () {
                        // Handle create action
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  {{/equals}}

  {{#equals this "update"}}
  void _navigateToEdit({{feature_name.pascalCase()}}Model item) {
    // Navigate to edit page
    // Navigator.of(context).pushNamed('/{{feature_name.snakeCase()}}/edit/${item.id}');
    // Or show bottom sheet/dialog for editing
    _showEditDialog(item);
  }

  void _showEditDialog({{feature_name.pascalCase()}}Model item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: context.height * 0.7,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.grey300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Edit ${item.title}',
                style: context.textTheme.titleLarge,
              ),
            ),
            // Add your edit form here
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Add form fields here with initial values
                    const Spacer(),
                    CustomElevatedButton(
                      title: 'Update',
                      onPressed: () {
                        // Handle update action
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  {{/equals}}

  {{#equals this "delete"}}
  void _confirmDelete({{feature_name.pascalCase()}}Model item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete ${item.title}'),
        content: const Text('Are you sure you want to delete this item? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _cubit.delete{{feature_name.pascalCase()}}(item.id);
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
  {{/equals}}

  {{#equals this "read"}}
  void _navigateToDetails({{feature_name.pascalCase()}}Model item) {
    // Navigate to details page
    // Navigator.of(context).pushNamed('/{{feature_name.snakeCase()}}/details/${item.id}');
  }
  {{/equals}}
  {{/crud_operations}}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: CustomScaffold(
        appBar: AppBar(
          title: const Text('{{feature_name.pascalCase()}}'),
          {{#crud_operations}}
          {{#equals this "create"}}
          actions: [
            IconButton(
              onPressed: _navigateToCreate,
              icon: const Icon(Icons.add),
            ),
          ],
          {{/equals}}
          {{/crud_operations}}
        ),
        body: BlocConsumer<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
          listener: (context, state) {
            // Handle state changes that require UI feedback
            if (state.hasCreateError || state.hasUpdateError || state.hasDeleteError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error?.message ?? 'An error occurred'),
                  backgroundColor: AppColors.error,
                ),
              );
            }

            if (state.isCreateSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item created successfully'),
                  backgroundColor: AppColors.success,
                ),
              );
            }

            if (state.isUpdateSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item updated successfully'),
                  backgroundColor: AppColors.success,
                ),
              );
            }

            if (state.isDeleteSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item deleted successfully'),
                  backgroundColor: AppColors.success,
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                {{#has_search}}
                // Search bar
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: {{feature_name.pascalCase()}}SearchBar(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    onClear: _clearSearch,
                    hint: 'Search {{feature_name.snakeCase()}}...',
                  ),
                ),
                {{/has_search}}
                
                // Content area
                Expanded(
                  child: _buildContent(context, state),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {{feature_name.pascalCase()}}State state) {
    if (state.isLoading) {
      return const LoadingWidget();
    }

    if (state.hasError) {
      return {{feature_name.pascalCase()}}ErrorState(
        error: state.error!,
        onRetry: _onRefresh,
      );
    }

    if (state.isEmpty) {
      return {{feature_name.pascalCase()}}EmptyState(
        {{#has_search}}
        hasActiveSearch: state.hasActiveSearch,
        searchQuery: state.searchQuery,
        onClearSearch: _clearSearch,
        {{/has_search}}
        {{#crud_operations}}
        {{#equals this "create"}}
        onCreateNew: _navigateToCreate,
        {{/equals}}
        {{/crud_operations}}
      );
    }

    return RefreshIndicator(
      onRefresh: () async => _onRefresh(),
      child: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: state.items.length + (state.isLoadingMore ? 1 : 0),
        separatorBuilder: (context, index) => 12.ph,
        itemBuilder: (context, index) {
          if (index >= state.items.length) {
            // Loading indicator for pagination
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final item = state.items[index];
          return {{feature_name.pascalCase()}}ListItem(
            item: item,
            {{#crud_operations}}
            {{#equals this "read"}}
            onTap: () => _navigateToDetails(item),
            {{/equals}}
            {{#equals this "update"}}
            onEdit: () => _navigateToEdit(item),
            {{/equals}}
            {{#equals this "delete"}}
            onDelete: () => _confirmDelete(item),
            {{/equals}}
            {{/crud_operations}}
            isLoading: state.isDeleting && state.selectedItem?.id == item.id,
          );
        },
      ),
    );
  }
}
