import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_transaction.freezed.dart';
part 'new_transaction.g.dart';

@freezed
class NewTransaction with _$NewTransaction {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NewTransaction({
    // String transactionDate,
    required double transactionAmount,
    required String creditUser,
    required String debitUser,
  }) = _NewTransaction;

  factory NewTransaction.fromJson(Map<String, dynamic> json) =>
      _$NewTransactionFromJson(json);
}
