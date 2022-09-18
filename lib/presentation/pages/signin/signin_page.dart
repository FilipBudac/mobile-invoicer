import 'package:casist2/core/routes_generator.dart';
import 'package:casist2/core/toaster.dart';
import 'package:casist2/presentation/pages/signin/bloc/signin_bloc.dart';
import 'package:casist2/presentation/pages/signin/bloc/signin_event.dart';
import 'package:casist2/presentation/pages/signin/bloc/signin_state.dart';
import 'package:casist2/presentation/pages/signin/signin_view.dart';
import 'package:casist2/presentation/widgets/error_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void dispatchSignInEvent() {
    BlocProvider.of<SignInBloc>(context).add(
      SignInPressedEvent(
        username: _usernameController.text,
        password: _passwordController.text
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (BuildContext context, SignInState state) {
          if (state is SignInFinishedState) {
            BlocProvider.of<SignInBloc>(context).add(
              SignInCacheUserEvent(user: state.user)
            );
          } else if (state is SignInErrorState) {
            Toaster.error(context, state.error);
          } else if (state is SignInUserCachedState) {
            RoutesNavigator.push(Routes.conf, state.user);
          }
        },
        builder: (BuildContext context, SignInState state) {
          if (
            state is SignInInitialState ||
            state is SignInErrorState ||
            state is SignInProcessingState
          ) {
            return SignInView(
              passwordController: _passwordController,
              usernameController: _usernameController,
              dispatchSignInEvent: dispatchSignInEvent,
            );
          }
          return const ErrorStateView();
        }
      ),
    );
  }
}
