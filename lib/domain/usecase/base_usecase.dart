import 'package:clean_architecture_mvvm/data/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUsecase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
