import 'package:flutter/material.dart';

class BouncingProfilePic extends StatefulWidget {
  @override
  _BouncingProfilePicState createState() => _BouncingProfilePicState();
}

class _BouncingProfilePicState extends State<BouncingProfilePic>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _appearanceAnimation;
  late final AnimationController _appearanceController;
  late final Image louis;
  bool louisIsLoaded = false;

  @override
  void initState() {
    louis = Image.asset('assets/louis.jpg');
    _appearanceController = AnimationController(duration: Duration(milliseconds: 1200), vsync: this)
      ..reset();
    _appearanceAnimation = CurvedAnimation(parent: _appearanceController, curve: Curves.elasticOut);
    _appearanceController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _appearanceController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(louis.image, context).whenComplete(() => louisIsLoaded = true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: Alignment.center,
      scale: _appearanceAnimation,
      child: Container(
        width: 400,
        child: Card(
          elevation: 8,
          margin: EdgeInsets.all(16),
          shape: CircleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 5,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: louis.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
