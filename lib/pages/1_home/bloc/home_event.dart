import 'home_state.dart';

/// Event being processed by [HomeBloc].
abstract class HomeEvent {
  const HomeEvent();
}

class LoginViaInput extends HomeEvent {
  final LoginTypes type;
  const LoginViaInput(this.type);
}

class DateInput extends HomeEvent {
  final DateTime date;
  const DateInput(this.date);
}

class ClearDateInput extends HomeEvent {}

class ClearInput extends HomeEvent {}
