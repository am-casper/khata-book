import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_list.freezed.dart';
part 'transaction_list.g.dart';

@freezed
class TransactionList with _$TransactionList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TransactionList({
    required String transactionDate,
    required double transactionAmount,
    required String user,
  }) = _TransactionList;

  factory TransactionList.fromJson(Map<String, dynamic> json) =>
      _$TransactionListFromJson(json);
}
