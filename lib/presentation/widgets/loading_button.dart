import 'package:flutter/material.dart';


class LoadingButton extends StatelessWidget {
  final String _title;
  final IconData _icon;
  final bool _loading;
  final void Function()? _onPressed;

  LoadingButton({
    super.key,
    required IconData icon,
    required String title,
    bool loading = false,
    void Function()? onPressed,
  }): _icon = icon,
      _title = title,
      _loading = loading,
      _onPressed = onPressed;

  // TODO: move to theme
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: const Color(0xffffffff),
    backgroundColor: const Color(0xff5cb85c),
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );

  Widget getButtonIcon() {
    return !_loading ?
    Icon(_icon, size: 18)
    : const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color(0xffffffff)),
          strokeWidth: 2
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: size.width * 0.8,
        height: 65,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: TextButton.icon(
            onPressed: _onPressed,
            style: flatButtonStyle,
            icon: getButtonIcon(),
            label: Text(_title, style: const TextStyle(fontSize: 18)),
          ),
        )
    );
  }
}
