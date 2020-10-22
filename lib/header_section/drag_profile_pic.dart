import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:resume_web_app/header_section/bouncing_profile_pic.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/physics.dart';

class DragProfilePic extends StatefulWidget {
  final ItemPositionsListener itemPositionsListener;
  DragProfilePic({
    @required this.itemPositionsListener,
  });

  @override
  _DragProfilePicState createState() => _DragProfilePicState();
}

class _DragProfilePicState extends State<DragProfilePic>
    with SingleTickerProviderStateMixin {
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
    _dragController = AnimationController(vsync: this);

    _dragController.addListener(() {
      setState(() {
        _dragAlignment = _dragAnimation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dragController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = Size(500, 500);
    return GestureDetector(
      onPanDown: (details) {
        _dragController.stop();
        _hasGrabbed = true;
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width * 5),
            details.delta.dy / (size.height * 5),
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
          child: BouncingProfilePic(
            itemPositionsListener: widget.itemPositionsListener,
          ),
        ),
      ),
    );
  }
}
