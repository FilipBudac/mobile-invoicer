import 'package:casist2/core/error/failures.dart';
import 'package:casist2/core/use_cases/use_case.dart';
import 'package:casist2/data/models/user.dart';
import 'package:casist2/domain/use_cases/start_app_use_case.dart';
import 'package:casist2/presentation/pages/welcome/cubit/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  final StartAppUseCase startApp;

  WelcomeCubit({required this.startApp}): super(
      const WelcomeInitialState(inProgress: false)
  );

  Future<void> onStartApp() async {
    emit(const WelcomeInitialState(inProgress: true));

    final result = await startApp(NoParams());
    return result.fold(
      (Failure failure) => emit(
        _mapFailureToState(failure)
      ),
      (User user) => emit(
        WelcomeFinishedState(user: user)
      )
    );
  }
}

WelcomeState _mapFailureToState(Failure failure) {
  switch (failure.runtimeType) {
    case UserFailure:
      return WelcomeUnfinishedState();
    default:
      return const WelcomeErrorState(error: "Aplikáciu sa nepodarilo naštartovať. Prosím skúste to znovu.");
  }
}