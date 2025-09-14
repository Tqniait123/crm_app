import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_app/core/api/response/response.dart';
import 'package:crm_app/core/errors/app_error.dart';
import 'package:crm_app/features/home/data/models/params/home_params.dart';
import 'package:crm_app/features/home/data/models/responses/home_model.dart';
import 'package:crm_app/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;
  HomeCubit(this._repo) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  /// Get Home data
  Future<void> getHome(HomeParams params) async {
    try {
      emit(HomeLoading());
      final response = await _repo.getHome(params);
      response.fold(
        (homeModel) => emit(HomeSuccess(homeModel)),
        (error) => emit(HomeError(error.message))
      );
    } on AppError catch (e) {
      emit(HomeError(e.message));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  /// Create new Home
  Future<void> createHome(HomeParams params) async {
    try {
      emit(HomeCreating());
      final response = await _repo.createHome(params);
      response.fold(
        (successMessage) => emit(HomeCreated(successMessage)),
        (error) => emit(HomeError(error.message)),
      );
    } on AppError catch (e) {
      emit(HomeError(e.message));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  /// Update existing Home
  Future<void> updateHome(HomeParams params) async {
    try {
      emit(HomeUpdating());
      final response = await _repo.updateHome(params);
      response.fold(
        (successMessage) => emit(HomeUpdated(successMessage)),
        (error) => emit(HomeError(error.message)),
      );
    } on AppError catch (e) {
      emit(HomeError(e.message));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  /// Delete Home
  Future<void> deleteHome(String id) async {
    try {
      emit(HomeDeleting());
      final response = await _repo.deleteHome(id);
      response.fold(
        (successMessage) => emit(HomeDeleted(successMessage)),
        (error) => emit(HomeError(error.message)),
      );
    } on AppError catch (e) {
      emit(HomeError(e.message));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
