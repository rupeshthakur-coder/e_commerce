import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(user) async {
    return sl<AuthFirebaseService>().signup(user);
  }
}
