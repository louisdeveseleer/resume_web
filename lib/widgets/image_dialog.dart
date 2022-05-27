import 'package:flutter/material.dart';

Future showImageDialog({
  @required BuildContext context,
  @required String imagePath,
}) async {
  await showDialog(
    context: context,
    builder: (_) => Dialog(
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Image.asset(imagePath),
        ),
      ),
    ),
  );
}
