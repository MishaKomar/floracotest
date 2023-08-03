import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

/// {@template home_bloc}
/// A simple [Bloc] that manages an [HomeState] as its state.
/// {@endtemplate}
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// {@macro home_bloc}
  HomeBloc() : super(const HomeState()) {
    on<LoginViaInput>((event, emit) => emit(state.copyWith(type: event.type)));
    on<DateInput>((event, emit) => emit(state.copyWith(date: event.date)));
    on<ClearDateInput>((event, emit) => emit(HomeState(type: state.type)));
    on<ClearInput>((event, emit) => emit(const HomeState()));
  }
}
