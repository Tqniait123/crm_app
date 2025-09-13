import 'package:dartz/dartz.dart';
import 'package:crm_app/config/app_settings/data/models/app_settings_model.dart';

abstract class AppSettingsRepo {
  Future<Either<AppSettings, String>> getAppSettings();
}
