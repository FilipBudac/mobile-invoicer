import 'package:casist2/core/routes_generator.dart';
import 'package:casist2/core/toaster.dart';
import 'package:casist2/core/themes.dart';
import 'package:casist2/presentation/pages/welcome/cubit/welcome_cubit.dart';
import 'package:casist2/presentation/pages/welcome/cubit/welcome_state.dart';
import 'package:casist2/presentation/pages/welcome/welcome_view.dart';
import 'package:casist2/presentation/widgets/error_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void _dispatchAppStart() {
    context.read<WelcomeCubit>().onStartApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Casist2Theme.mainColor,
      body: BlocConsumer<WelcomeCubit, WelcomeState>(
        listener: (BuildContext context, WelcomeState state) {
          if (state is WelcomeErrorState) {
            Toaster.error(context, state.error);
          } else if (state is WelcomeFinishedState) {
            // TODO: replace conf with home
            RoutesNavigator.push(Routes.conf, state.user);
          } else if (state is WelcomeUnfinishedState) {
            RoutesNavigator.push(Routes.signin);
          }
        },
        builder: (BuildContext context, WelcomeState state) {
          if (state is WelcomeInitialState) {
            return WelcomeView(
              inProgress: state.inProgress,
              dispatchAppStart: _dispatchAppStart
            );
          }
          return const ErrorStateView();
        }
      ),
    );
  }
}
