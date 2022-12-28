import 'package:flutter/material.dart';

class PortfolioSubsection extends StatelessWidget {
  PortfolioSubsection({
    required this.image,
    required this.content,
    this.isLeftAligned: true,
  });

  final Widget image;
  final Widget content;
  final bool isLeftAligned;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      verticalDirection: isLeftAligned ? VerticalDirection.up : VerticalDirection.down,
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
      child: image,
    );
  }
}
