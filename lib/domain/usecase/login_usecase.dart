// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_mvvm/data/network/error_handler.dart';
import 'package:clean_architecture_mvvm/data/network/failure.dart';
import 'package:clean_architecture_mvvm/data/request/request.dart';
import 'package:clean_architecture_mvvm/domain/model/model.dart';
import 'package:clean_architecture_mvvm/domain/repository/repository.dart';
import 'package:clean_architecture_mvvm/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase implements BaseUsecase<LoginUseCaseInput, Authentication> {
  Repository? repository;
  @override
  Future<Either<Failure, Authentication>> execute(
    LoginUseCaseInput input,
  ) async {
    try {
      final result = await repository!.login(
        LoginRequest(
          email: input.email,
          password: input.password,
          imei: 'imei',
          deviceType: "deviceType",
        ),
      );
      return result;
    } catch (e) {
      return Left(
        Failure(
          code: ApiInternalStatus.FAILURE,
          message: ResponseMessage.DEFAULT,
        ),
      );
    }
  }
}

class LoginUseCaseInput {
  String? email;
  String? password;
  LoginUseCaseInput({this.email, this.password});
}
