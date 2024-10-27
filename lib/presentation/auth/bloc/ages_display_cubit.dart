import 'package:e_commerce/domain/auth/usecase/get_ages_usecase.dart';
import 'package:e_commerce/presentation/auth/bloc/ages_display_state.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(Agesloading());
  Future<void> displayAges() async {
    var returnedData = await sl<GetAgesUsecase>().call();
    returnedData.fold(
      (message) {
        emit(AgesloadFailure(message: message));
      },
      (data) {
        emit(Agesloaded(ages: data));
      },
    );
  }
}
