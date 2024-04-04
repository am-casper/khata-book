import 'package:khata_book/data/constants/env_config.dart';

class ApiEndpoints {
  static const String baseUrl = EnvironmentConfig.BASE_URL;

  static const String userProfile = '/user/';
  static const String signUp = '/user/create';

  static const String listTransactions = '/transactions/';
  static const String addTransaction = '/transactions/create';
}
