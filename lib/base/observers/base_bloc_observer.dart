import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template app_bloc_observer}
/// Custom [BlocObserver] that observes all bloc and cubit state changes.
/// {@endtemplate}
class BaseBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const BaseBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
