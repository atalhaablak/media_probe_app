
import 'package:dartz/dartz.dart';
import 'package:media_probe_app/core/error/failure.dart';

abstract class INetworkManager {
  Future<Either<Failure, Map<String, dynamic>>> get({required String endPoint});
}
