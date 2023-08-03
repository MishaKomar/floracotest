// import 'package:flutter_bloc/flutter_bloc.dart';

// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   AuthenticationBloc()
//       : super(
//           UnauthenticatedState(),
//         ) {
//     on<UserLoginViaInputEvent>(
//       (event, emit) => emit(AuthenticationViaState(event.type)),
//     );
//     on<UserLoginEvent>(
//       (event, emit) => emit(AuthenticatedState()),
//     );
//     on<UserLogoutEvent>(
//       (event, emit) => emit(UnauthenticatedState()),
//     );
//   }
// }

// enum LoginTypes {
//   period,
//   pregnant,
// }

// // Authentication events
// abstract class AuthenticationEvent {}

// class UserLoginViaInputEvent extends AuthenticationEvent {
//   final LoginTypes type;
//   UserLoginViaInputEvent(this.type);
// }

// class UserLoginEvent extends AuthenticationEvent {}

// class UserLogoutEvent extends AuthenticationEvent {}

// // Authentication states
// abstract class AuthenticationState {}

// class UnauthenticatedState extends AuthenticationState {}

// class AuthenticationViaState extends AuthenticationState {
//   final LoginTypes type;
//   AuthenticationViaState(this.type);
// }

// class AuthenticatedState extends AuthenticationState {}
