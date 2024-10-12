import 'package:e_commerce/data/auth/repository_impl/auth_repository_impl.dart';
import 'package:e_commerce/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce/domain/auth/usecase/sign_up_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
//services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
//repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
//Usecases
  sl.registerSingleton<SignUpUsecase>(SignUpUsecase());
}
