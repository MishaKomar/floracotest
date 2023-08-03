/// {@template home_state}
/// A simple state model for [HomeBloc].
/// {@endtemplate}

enum LoginTypes {
  period,
  pregnant,
}

class HomeState {
  final LoginTypes? type;
  final DateTime? date;

  String? get periodLabel => isPeriod && isDateSelected
      ? '${date!.day}/${date!.month}/${date!.year}'
      : null;

  String? get pregnantLabel =>
      isPregnant && isDateSelected ? '${date!.year}' : null;

  bool get isPeriod => type == LoginTypes.period;
  bool get isPregnant => type == LoginTypes.pregnant;

  bool get loginTypeSelected => type != null;
  bool get isDateSelected => date != null;

  /// {@macro home_state}
  const HomeState({
    this.type,
    this.date,
  });

  HomeState copyWith({
    LoginTypes? type,
    DateTime? date,
  }) =>
      HomeState(
        type: type ?? this.type,
        date: date ?? this.date,
      );
}
