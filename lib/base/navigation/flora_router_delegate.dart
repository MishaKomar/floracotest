import 'package:floracotest/pages/1_home/bloc/home_bloc.dart';
import 'package:floracotest/pages/1_home/bloc/home_event.dart';
import 'package:floracotest/pages/1_home/bloc/home_state.dart';
import 'package:floracotest/pages/1_home/home_page.dart';
import 'package:floracotest/pages/2_date_selector/date_selector_page.dart';
import 'package:floracotest/pages/3_statistics/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloraCoRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  bool showOtherPage = false;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  FloraCoRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Navigator(
          key: navigatorKey,
          pages: [
            const MaterialPage(
              child: HomePage(),
            ),
            if (state.loginTypeSelected)
              MaterialPage(
                child: DateSelectorPage(type: state.type!),
              ),
            if (state.isDateSelected)
              const MaterialPage(
                child: StatisticsPage(),
              ),
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;

            final bloc = context.read<HomeBloc>();
            final state = bloc.state;
            if (state.loginTypeSelected && state.isDateSelected) {
              bloc.add(ClearDateInput());
            } else {
              bloc.add(ClearInput());
            }
            return true;
          },
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
