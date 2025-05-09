import 'package:bookly_app/core/errors/failuers.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failures, Type>> call([Param param]);
}

class NoParam {}
