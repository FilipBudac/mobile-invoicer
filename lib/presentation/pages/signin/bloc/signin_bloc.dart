import 'package:casist2/core/error/failures.dart';
import 'package:casist2/data/models/user.dart';
import 'package:casist2/domain/entities/user.dart';
import 'package:casist2/domain/use_cases/user_cache_use_case.dart';
import 'package:casist2/domain/use_cases/user_signin_use_case.dart';
import 'package:casist2/presentation/pages/signin/bloc/signin_event.dart';
import 'package:casist2/presentation/pages/signin/bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUserUseCase signIn;
  final CacheUserUseCase cacheUser;

  SignInBloc({
    required this.signIn,
    required this.cacheUser,
  }) : super(SignInInitialState()) {

    on<SignInPressedEvent>(
      (event, emit) async {
        emit(SignInProcessingState());

        final result = await signIn.call(
          SignInParams(
            username: event.username,
            password: event.password
          )
        );
        return result.fold(
          (Failure failure) => emit(const SignInErrorState("Nastala chyba pri prihlásení.")),
          (User user) => emit(SignInFinishedState(user: user))
        );
      },
    );

    on<SignInCacheUserEvent>(
      (event, emit) async {
        final result = await cacheUser.call(
          CacheUserParams(user: event.user)
        );
        return result.fold(
          (Failure failure) => emit(const SignInErrorState("Nastala chyba pri cachingu.")),
          (User user) => emit(SignInUserCachedState(user: user))
        );
      },
    );

  }
}