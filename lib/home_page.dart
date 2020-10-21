import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_web_app/athlete_section/athlete_section.dart';
import 'package:resume_web_app/contact_section/contact_section.dart';
import 'package:resume_web_app/developer_section/developer_section.dart';
import 'package:resume_web_app/engineer_section/engineer_section.dart';
import 'package:resume_web_app/footer_section/footer_section.dart';
import 'package:resume_web_app/header_section/header_section.dart';
import 'package:resume_web_app/header_section/menu.dart';
import 'package:resume_web_app/header_section/menu_item.dart';
import 'package:resume_web_app/personal_section/personal_section.dart';
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
        hasScrolled =
            itemPositionsListener.itemPositions.value.first.itemLeadingEdge < 0
                ? true
                : false;
      });
    });
    super.initState();
  }

  void gotToSection(int sectionNumber) {
    itemScrollController.scrollTo(
      index: sectionNumber,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: hasScrolled ? Colors.black26 : Colors.transparent,
          ),
          curve: Curves.easeInOut,
          child: Menu(
            menu: menu,
          ),
        ),
      ),
      body: ScrollablePositionedList.builder(
        scrollDirection: Axis.vertical,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        itemCount: 7,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return HeaderSection(
                itemPositionsListener: itemPositionsListener,
              );
              break;
            case 1:
              return PersonalSection();
              break;
            case 2:
              return EngineerSection();
              break;
            case 3:
              return DeveloperSection();
              break;
            case 4:
              return AthleteSection();
              break;
            case 5:
              return ContactSection();
              break;
            case 6:
              return FooterSection();
              break;
            default:
              return Container(
                child: Text('Error'),
              );
          }
        },
      ),
    );
  }
}
