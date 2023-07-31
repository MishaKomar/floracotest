/// Event being processed by [HomeBloc].
abstract class HomeEvent {
  const HomeEvent();
}

/// Notifies bloc about period date state changes.
class PeriodDateInput extends HomeEvent {
  final DateTime date;
  const PeriodDateInput(this.date);
}

/// Notifies bloc about pregnant date state changes.
class PregnantDateInput extends HomeEvent {
  final DateTime date;
  const PregnantDateInput(this.date);
}

class ClearDateInput extends HomeEvent {
  const ClearDateInput();
}
