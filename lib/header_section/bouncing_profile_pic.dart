import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BouncingProfilePic extends StatefulWidget {
  final ItemPositionsListener itemPositionsListener;
  BouncingProfilePic({
    @required this.itemPositionsListener,
  });

  @override
  _BouncingProfilePicState createState() => _BouncingProfilePicState();
}

class _BouncingProfilePicState extends State<BouncingProfilePic>
    with SingleTickerProviderStateMixin {
  Animation<double> _appearanceAnimation;
  AnimationController _appearanceController;
  Image louis;
  bool louisIsLoaded = false;

  @override
  void initState() {
    louis = Image.asset('assets/louis.jpg');
    _appearanceController =
        AnimationController(duration: Duration(milliseconds: 1200), vsync: this)
          ..reset();
    _appearanceAnimation = CurvedAnimation(
        parent: _appearanceController, curve: Curves.elasticOut);
    widget.itemPositionsListener.itemPositions.addListener(() {
      if (widget.itemPositionsListener.itemPositions.value.first
                  .itemTrailingEdge <
              1.2 &&
          !_appearanceController.isAnimating &&
          louisIsLoaded) {
        _appearanceController.forward();
      }
    });
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
    precacheImage(louis.image, context)
        .whenComplete(() => louisIsLoaded = true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: Alignment.center,
      scale: _appearanceAnimation,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(20),
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Card(
          margin: EdgeInsets.all(0),
          shape: CircleBorder(
            side: BorderSide(
              color: Theme.of(context).accentColor,
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
