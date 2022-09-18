import 'package:flutter/material.dart';

class PageNotFound extends StatefulWidget {
  const PageNotFound({super.key});

  @override
  PageNotFoundState createState() => PageNotFoundState();
}

class PageNotFoundState extends State<PageNotFound> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final RelativeRectTween _relativeRectTween = RelativeRectTween(
    begin: const RelativeRect.fromLTRB(24, 24, 24, 200),
    end: const RelativeRect.fromLTRB(24, 24, 24, 250),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
    )
    ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: [
          PositionedTransition(
            rect: _relativeRectTween.animate(_controller),
            child: Image.asset('assets/images/yoga_brain.png'),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            left: 24,
            right: 24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  '404',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    letterSpacing: 2,
                    color: Color(0xff2f3640),
                    fontFamily: 'Anton',
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Prepáčte, stánku sa nepodarilo nájsť!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff2f3640),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
