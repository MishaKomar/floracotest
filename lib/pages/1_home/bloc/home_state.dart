/// {@template home_state}
/// A simple state model for [HomeBloc].
/// {@endtemplate}
class HomeState {
  final DateTime? period;
  final DateTime? pregnant;

  String? get periodLabel =>
      period != null ? '${period!.day}/${period!.month}/${period!.year}' : null;

  String? get pregnantLabel => pregnant != null
      ? '${pregnant!.day}/${pregnant!.month}/${pregnant!.year}'
      : null;

  /// {@macro home_state}
  const HomeState({
    this.period,
    this.pregnant,
  });

  HomeState copyWith({
    DateTime? period,
    DateTime? pregnant,
  }) =>
      HomeState(
        period: period ?? this.period,
        pregnant: pregnant ?? this.pregnant,
      );
}
