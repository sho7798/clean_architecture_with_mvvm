// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_mvvm/data/network/error_handler.dart';

class Failure {
  int? code;
  String? message;
  Failure({this.code, this.message});
}

class DefaultFailure extends Failure {
  DefaultFailure()
    : super(code: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
}
