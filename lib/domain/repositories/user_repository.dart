import 'package:flutter/foundation.dart';
import 'package:khata_book/data/constants/constants.dart';
import 'package:khata_book/data/services/remote/api_service.dart';
import 'package:khata_book/domain/models/failure_model.dart';
import 'package:khata_book/domain/models/user/user.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);

  Future<User> getCurrentUser(String phone) async {
    try {
      return await _apiService.getCurrentUser(phone);
    } catch (e) {
      debugPrint(e.toString());
      throw Failure(AppConstants.GENERIC_FAILURE);
    }
  }

  Future<void> signUpUser(User user) async {
    try {
      await _apiService.signUpUser(user);
    } catch (e) {
      debugPrint(e.toString());
      throw Failure(AppConstants.GENERIC_FAILURE);
    }
  }
}
