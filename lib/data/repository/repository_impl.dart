// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_mvvm/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_mvvm/data/mapper/mapper.dart';
import 'package:clean_architecture_mvvm/data/network/failure.dart';
import 'package:clean_architecture_mvvm/data/network/network_info.dart';
import 'package:clean_architecture_mvvm/data/request/request.dart';
import 'package:clean_architecture_mvvm/domain/model/model.dart';
import 'package:clean_architecture_mvvm/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource? remoteDataSource;
  NetworkInfo? networkInfo;
  RepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, Authentication>> login(
    LoginRequest loginRequest,
  ) async {
    if (await networkInfo!.isConnected) {
      // its safe to call the API
      final response = await remoteDataSource?.login(loginRequest);

      if (response?.status == 0) {
        // success
        // return data (success)
        // return right
        return Right(response.toDomain());
      } else {
        // return biz logic error
        // return left
        return Left(
          Failure(
            code: 409,
            message:
                response?.message ?? "we have biz error logic from API side",
          ),
        );
      }
    } else {
      // return connection error
      return Left(
        Failure(code: 501, message: "please check your internet connection"),
      );
    }
  }
}
