import 'package:casist2/core/themes.dart';
import 'package:casist2/presentation/widgets/headings.dart';
import 'package:casist2/presentation/widgets/image.dart';
import 'package:casist2/presentation/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/separator.dart';

class WelcomeView extends StatelessWidget {
  final bool _inProgress;
  final void Function() _dispatchAppStart;

  const WelcomeView({
    super.key,
    required bool inProgress,
    required void Function() dispatchAppStart
  }): _inProgress = inProgress,
      _dispatchAppStart = dispatchAppStart;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const RoundedImage(width: 140, height: 140),
            const Separator(height: 10),
            const Heading2(
              "Prihlásenie do systému Casist2",
              bold: FontWeight.w500,
              color: Casist2Theme.secondaryColor
            ),
            const Separator(height: 5),
            LoadingButton(
              title: "Prihlásiť sa".toUpperCase(),
              onPressed: () => _dispatchAppStart(),
              icon: Icons.input,
              loading: _inProgress,
            )
          ],
        )
    );
  }
}
