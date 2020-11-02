import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_web_app/athlete_section/athlete_section.dart';
import 'package:resume_web_app/contact_section/contact_section.dart';
import 'package:resume_web_app/developer_section/developer_section.dart';
import 'package:resume_web_app/developer_section/portfolio_section.dart';
import 'package:resume_web_app/engineer_section/engineer_section.dart';
import 'package:resume_web_app/footer_section/footer_section.dart';
import 'package:resume_web_app/header_section/header_section.dart';
import 'package:resume_web_app/menu_item.dart';
import 'package:resume_web_app/personal_section/personal_section.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  bool hasScrolled = false;

  final List<String> menuItems = [
    'Engineer',
    'Developer',
    'Athlete',
    'Contact',
  ];

  @override
  void initState() {
    itemPositionsListener.itemPositions.addListener(() {
      setState(() {
        hasScrolled = itemPositionsListener.itemPositions.value
                .any((element) => element.itemLeadingEdge < 0)
            ? true
            : false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    void gotToSection(int sectionNumber) {
      itemScrollController.scrollTo(
        index: sectionNumber,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      if (isSmallScreen) {
        Navigator.pop(context);
      }
    }

    List<Widget> menu = List.generate(
      menuItems.length,
      (index) => GestureDetector(
        child: MenuItem(
          text: menuItems[index],
        ),
        onTap: () => gotToSection(index + 2),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawerEdgeDragWidth: 0,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        title: _buildAnimatedOpacity(
          isSmallScreen
              ? Builder(
                  builder: (context) => Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: menu,
                ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: isSmallScreen
          ? Drawer(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Menu',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.black45,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: menu.length,
                        separatorBuilder: (context, _) {
                          return Divider();
                        },
                        itemBuilder: (builder, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: menu[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: Scrollbar(
        radius: Radius.circular(2),
        child: ScrollablePositionedList.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemCount: 8,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return HeaderSection(
                  itemPositionsListener: itemPositionsListener,
                );
                break;
              case 1:
                return PersonalSection2();
                break;
              case 2:
                return EngineerSection();
                break;
              case 3:
                return DeveloperSection();
                break;
              case 4:
                return PortfolioSection();
                break;
              case 5:
                return AthleteSection();
                break;
              case 6:
                return ContactSection();
                break;
              case 7:
                return FooterSection();
                break;
              default:
                return Container(
                  child: Text('Error'),
                );
            }
          },
        ),
      ),
    );
  }

  AnimatedContainer _buildAnimatedOpacity(Widget child) {
    return AnimatedContainer(
      height: kToolbarHeight,
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: hasScrolled ? Colors.white24 : Colors.transparent,
      ),
      curve: Curves.easeInOut,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: child,
        ),
      ),
    );
  }
}
