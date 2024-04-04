import 'package:dio/dio.dart';
import 'package:khata_book/domain/models/transaction/new_transaction.dart';
import 'package:khata_book/domain/models/transaction/transaction_list.dart';
import 'package:khata_book/domain/models/user/user.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:async';

import 'package:khata_book/data/constants/api_endpoints.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiEndpoints.userProfile)
  Future<User> getCurrentUser(
    @Query("phone") String phone,
  );

  @POST(ApiEndpoints.signUp)
  Future<User> signUpUser(
    @Body() User user,
  );

  @GET(ApiEndpoints.listTransactions)
  Future<List<TransactionList>> getTransactions(
    @Query("phone") String phone,
  );

  @POST(ApiEndpoints.addTransaction)
  Future<void> addTransaction(
    @Body() NewTransaction newTransaction,
  );
}
