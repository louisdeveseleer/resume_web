import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';

class Menu extends StatelessWidget {
  final List<Widget> menu;
  Menu({
    @required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ResponsiveWidget.isSmallScreen(context)
            ? IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white70,
                ),
                onPressed: () {})
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: menu,
              ),
      ),
    );

    // return Drawer(
    //   child: ListView.separated(
    //     itemCount: menuItems.length,
    //     separatorBuilder: (context, index) => Divider(),
    //     itemBuilder: (context, index) {
    //       return GestureDetector(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(
    //               menuItems[index],
    //               style: Theme.of(context).textTheme.headline6,
    //             ),
    //           ),
    //           onTap: () {
    //             Navigator.pop(context);
    //             gotToSection(index + 2);
    //           });
    //     },
    //   ),
    // );
  }
}
