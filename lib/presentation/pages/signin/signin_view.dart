import 'package:casist2/presentation/widgets/form_input_field.dart';
import 'package:casist2/presentation/widgets/headings.dart';
import 'package:casist2/presentation/widgets/loading_button.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final void Function() _dispatchSignInEvent;

  const SignInView({
    super.key,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required Function() dispatchSignInEvent,
  }): _usernameController = usernameController,
      _passwordController = passwordController,
      _dispatchSignInEvent = dispatchSignInEvent;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                Image.asset('assets/images/casist_logo.png'),
                const Heading2("Prihlásenie do systému"),
                const Heading1("Casist 2", bold: FontWeight.bold),
              ],
            ),
            FormInputField(
              labelText: "Prihlasovacie meno",
              controller: _usernameController,
              icon: Icons.person_pin,
            ),
            FormInputField(
              labelText: "Prihlasovacie heslo",
              controller: _passwordController,
              icon: Icons.lock_open,
              obscureText: true,
            ),
            LoadingButton(
              title: "Prihlásiť sa".toUpperCase(),
              icon: Icons.input,
              onPressed: _dispatchSignInEvent,
            ),
          ],
        ),
      ),
    );
  }
}
