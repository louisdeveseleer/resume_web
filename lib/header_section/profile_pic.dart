import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/physics.dart';

class ProfilePic extends StatefulWidget {
  final ItemPositionsListener itemPositionsListener;
  ProfilePic({
    @required this.itemPositionsListener,
  });

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> with TickerProviderStateMixin {
  Animation<double> _appearanceAnimation;
  AnimationController _controller;
  Image louis;
  bool louisIsLoaded = false;
  Alignment _dragAlignment = Alignment.center;
  Animation<Alignment> _dragAnimation;
  AnimationController _dragController;
  bool _hasGrabbed = false;

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _dragAnimation = _dragController.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _dragController.animateWith(simulation);
  }

  @override
  void initState() {
    louis = Image.asset('assets/louis.jpg');
    _controller =
        AnimationController(duration: Duration(milliseconds: 1200), vsync: this)
          ..reset();
    _appearanceAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    widget.itemPositionsListener.itemPositions.addListener(() {
      if (widget.itemPositionsListener.itemPositions.value.first
                  .itemTrailingEdge <
              1.2 &&
          !_controller.isAnimating &&
          louisIsLoaded) {
        _controller.forward();
      }
    });
    _dragController = AnimationController(vsync: this);

    _dragController.addListener(() {
      setState(() {
        _dragAlignment = _dragAnimation.value;
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(louis.image, context)
        .whenComplete(() => louisIsLoaded = true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _dragController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
        _hasGrabbed = true;
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
        _hasGrabbed = false;
      },
      child: MouseRegion(
        cursor:
            _hasGrabbed ? SystemMouseCursors.grabbing : SystemMouseCursors.grab,
        child: Align(
          alignment: _dragAlignment,
          child: ScaleTransition(
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
                        image: AssetImage('assets/louis.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
