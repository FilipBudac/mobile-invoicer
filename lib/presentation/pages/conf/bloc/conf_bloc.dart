import 'package:casist2/core/error/failures.dart';
import 'package:casist2/core/use_cases/use_case.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/data/models/user.dart';
import 'package:casist2/domain/use_cases/scan_code_use_case.dart';
import 'package:casist2/domain/use_cases/search_companies_use_case.dart';
import 'package:casist2/domain/use_cases/user_cache_use_case.dart';
import 'package:casist2/presentation/pages/conf/bloc/conf_event.dart';
import 'package:casist2/presentation/pages/conf/bloc/conf_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfBloc extends Bloc<ConfEvent, ConfState> {
  final ScanCodeUseCase scanCode;
  final SearchCompaniesUseCase searchCompaniesUseCase;
  final CacheUserUseCase cacheUserUseCase;

  ConfBloc({
    required this.scanCode,
    required this.searchCompaniesUseCase,
    required this.cacheUserUseCase,
  }) : super(ConfInitialState()) {
    on<ConfScanEvent>(
      (event, emit) async {
        emit(ConfProcessingState());

        final result = await scanCode.call(NoParams());
        return result.fold(
          (Failure failure) => emit(
            const ConfErrorState("Nastala chyba pri skenovaní.")
          ),
          (String code) => emit(
            ConfScannedState(idNumber: code)
          )
        );
      },
    );

    on<ConfAgendaSelectedEvent>(
      (event, emit) async {
        emit(ConfProcessingState());

        final result = await searchCompaniesUseCase.call(
          SearchCompaniesParams(agenda: event.agenda)
        );
        return result.fold(
          (Failure failure) => emit(
            _mapFailureToState(failure)
          ),
          (List<Company> companies) => emit(
            ConfAgendaSelectedState(
              companies: companies,
              agenda: event.agenda,
              message: "Firmy sa podarilo úspešne nahrať."
            )
          )
        );
      },
    );

    on<ConfSaveEvent>(
      (event, emit) async {
        emit(ConfProcessingState());

        final result = await cacheUserUseCase.call(
          CacheUserParams(user: event.user)
        );
        return result.fold(
          (Failure failure) => emit(
            const ConfErrorState("Nastala chyba pri uložení.")
          ),
          (User user) => emit(
            ConfFinishedState(user: user)
          )
        );
      },
    );
  }
}

ConfState _mapFailureToState(Failure failure) {
  switch (failure.runtimeType) {
    case AuthorizationFailure:
      return ConfUnauthorizedState();
    default:
      return const ConfErrorState("Nastala chyba získaní firiem.");
  }
}
