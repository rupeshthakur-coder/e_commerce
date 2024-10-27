import 'package:dartz/dartz.dart';
import 'package:e_commerce/common/bloc/Button/button_state.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  // ButtonCubit(super.initialState);
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    try {
      Either returenedData = await usecase.call(params: params);
      returenedData.fold((error) {
        emit(ButtonFaliureState());
      }, (data) {
        ButtonFaliureState();
      });
    } catch (e) {
      emit(ButtonFaliureState());
    }
  }
}
