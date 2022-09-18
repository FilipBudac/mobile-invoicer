import 'package:casist2/core/boostrap.dart';
import 'package:casist2/data/models/user.dart';
import 'package:casist2/presentation/pages/conf/bloc/conf_bloc.dart';
import 'package:casist2/presentation/pages/conf/conf_page.dart';
import 'package:casist2/presentation/pages/home/bloc/home_bloc.dart';
import 'package:casist2/presentation/pages/home/home_page.dart';
import 'package:casist2/presentation/pages/signin/bloc/signin_bloc.dart';
import 'package:casist2/presentation/pages/signin/signin_page.dart';
import 'package:casist2/presentation/pages/welcome/cubit/welcome_cubit.dart';
import 'package:casist2/presentation/pages/welcome/welcome_page.dart';
import 'package:casist2/presentation/widgets/page_not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Routes {
  home,
  signin,
  conf,
  welcome,
  settings
}

class _Paths {
  static const welcome = '/';
  static const signin = 'signin';
  static const conf = 'conf';
  static const home = 'orders';
  static const settings = 'settings';

  static const Map<Routes, String> _pathMap = {
    Routes.welcome: _Paths.welcome,
    Routes.signin: _Paths.signin,
    Routes.conf: _Paths.conf,
    Routes.home: _Paths.home,
    Routes.settings: _Paths.settings
  };

  static String of(Routes route) => _pathMap[route] ?? welcome;
}

// navigatorKey: locator<RoutesNavigator>().navigatorKey,
class RoutesNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route<dynamic> generate (RouteSettings settings) {
    switch (settings.name) {

      case _Paths.welcome:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => locator<WelcomeCubit>(),
            child: const WelcomePage(),
          ),
        );

    case _Paths.signin:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => locator<SignInBloc>(),
          child: const SignInPage(),
        ),
      );

      case _Paths.conf:
        final User user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => locator<ConfBloc>(),
            child: ConfPage(user: user),
          ),
        );

      case _Paths.home:
        final User user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => locator<HomeBloc>(),
            child: HomePage(user: user),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const PageNotFound()
        );
    }
  }

  static NavigatorState? get state => navigatorKey.currentState;

  static Future? push<T>(
    Routes route,
    [T? arguments]
  ) => state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(
    Routes route,
    [T? arguments]
  ) => state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();
}