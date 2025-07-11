import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialEvent> (splashInitialEvent);
    on<LoadingAnimationDoneActionEvent>(loadingAnimationDoneActionEvent);

  }

  FutureOr<void> splashInitialEvent(SplashInitialEvent event, Emitter<SplashState> emit) {
    emit(SplashLoadingState());
  }

  Future<void> loadingAnimationDoneActionEvent(LoadingAnimationDoneActionEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoadingSuccessState());
    await Future.delayed(Duration(seconds: 2));
    emit(SplashScreenDoneState());

  }


}
