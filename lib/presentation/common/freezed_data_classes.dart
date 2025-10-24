import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  LoginObject({required this.userName, required this.password});
  @override
  final String userName;
  @override
  final String password;
}
