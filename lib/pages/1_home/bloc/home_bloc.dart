import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

/// {@template home_bloc}
/// A simple [Bloc] that manages an [HomeState] as its state.
/// {@endtemplate}
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// {@macro home_bloc}
  HomeBloc()
      : super(
          const HomeState(),
        ) {
    on<PeriodDateInput>(
      (event, emit) => emit(state.copyWith(period: event.date)),
    );
    on<PregnantDateInput>(
      (event, emit) => emit(state.copyWith(pregnant: event.date)),
    );
    on<ClearDateInput>(
      (event, emit) => emit(const HomeState()),
    );
  }
}
