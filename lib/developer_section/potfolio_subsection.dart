import 'package:flutter/material.dart';

class PortfolioSubsection extends StatelessWidget {
  PortfolioSubsection({
    @required this.imagePath,
    @required this.content,
    this.isLeftAligned: true,
    this.imageOffset: 0.5,
  });

  final String imagePath;
  final Widget content;
  final bool isLeftAligned;
  final double imageOffset;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      verticalDirection:
          isLeftAligned ? VerticalDirection.down : VerticalDirection.up,
      spacing: 100,
      runSpacing: 50,
      children: [
        isLeftAligned ? _buildImage() : _buildContent(),
        isLeftAligned ? _buildContent() : _buildImage(),
      ],
    );
  }

  Container _buildContent() {
    return Container(
      width: 500,
      child: content,
    );
  }

  Container _buildImage() {
    return Container(
      padding: EdgeInsets.only(bottom: 70),
      width: 400,
      constraints: BoxConstraints(maxHeight: 600),
      child: AnimatedAlign(
        curve: Curves.fastLinearToSlowEaseIn,
        alignment: Alignment(0, -imageOffset * 2 + 1),
        heightFactor: 0.8,
        duration: Duration(milliseconds: 500),
        child: Image.asset(imagePath),
      ),
    );
  }
}
