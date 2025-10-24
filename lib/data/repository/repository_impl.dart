// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_mvvm/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_mvvm/data/mapper/mapper.dart';
import 'package:clean_architecture_mvvm/data/network/error_handler.dart';
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
      try {
        final response = await remoteDataSource?.login(loginRequest);
        // its safe to call the API
        if (response?.status == ApiInternalStatus.SUCCESS) {
          // success
          // return right
          return Right(response.toDomain());
        } else {
          // return left
          return Left(
            Failure(
              code: response?.status ?? ApiInternalStatus.FAILURE,
              message: response?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
