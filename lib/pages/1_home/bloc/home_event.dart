/// Event being processed by [HomeBloc].
abstract class HomeEvent {
  final DateTime date;
  const HomeEvent(this.date);
}

/// Notifies bloc about period date state changes.
class PeriodDateInput extends HomeEvent {
  const PeriodDateInput(DateTime date) : super(date);
}

/// Notifies bloc about pregnant date state changes.
class PregnantDateInput extends HomeEvent {
  const PregnantDateInput(DateTime date) : super(date);
}
