import 'package:flutter/material.dart';
import 'package:resume_web_app/personal_section/personal_card.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';

class PersonalSection extends StatefulWidget {
  const PersonalSection({
    Key key,
  }) : super(key: key);

  @override
  _PersonalSectionState createState() => _PersonalSectionState();
}

class _PersonalSectionState extends State<PersonalSection> {
  Image soignies1;
  Image soignies2;
  Image raleigh1;
  Image raleigh2;
  Image imari1;
  Image imari2;
  Image bella1;
  Image bella2;

  @override
  void initState() {
    super.initState();
    soignies1 =
        Image.asset('assets/soignies-grandplace.jpg', fit: BoxFit.cover);
    soignies2 = Image.asset('assets/soignies-map.jpg', fit: BoxFit.cover);
    raleigh1 = Image.asset('assets/raleigh-downtown.jpg', fit: BoxFit.cover);
    raleigh2 = Image.asset('assets/raleigh-map.jpg', fit: BoxFit.cover);
    imari1 = Image.asset('assets/imari.jpg', fit: BoxFit.cover);
    imari2 = Image.asset('assets/imari_and_louis.jpg', fit: BoxFit.cover);
    bella1 = Image.asset('assets/bella.jpg', fit: BoxFit.cover);
    bella2 = Image.asset('assets/bella2.jpg', fit: BoxFit.cover);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(soignies1.image, context);
    precacheImage(soignies2.image, context);
    precacheImage(raleigh1.image, context);
    precacheImage(raleigh2.image, context);
    precacheImage(imari1.image, context);
    precacheImage(imari2.image, context);
    precacheImage(bella1.image, context);
    precacheImage(bella2.image, context);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width,
          height: width > 1600
              ? 600
              : width < 800
                  ? 2000
                  : 1000,
          padding: ResponsiveWidget.isSmallScreen(context)
              ? EdgeInsets.all(32.0)
              : EdgeInsets.all(64.0),
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.center,
            spacing: 64,
            runSpacing: 64,
            children: [
              PersonalCard(
                text: 'Born in Soignies, Belgium',
                imagePath1: 'assets/soignies-grandplace.jpg',
                imagePath2: 'assets/soignies-map.jpg',
              ),
              PersonalCard(
                text: 'Living in Raleigh, NC',
                imagePath1: 'assets/raleigh-downtown.jpg',
                imagePath2: 'assets/raleigh-map.jpg',
              ),
              PersonalCard(
                text: 'with wife Imari',
                imagePath1: 'assets/imari.jpg',
                imagePath2: 'assets/imari_and_louis.jpg',
              ),
              PersonalCard(
                text: 'and cat Bella',
                imagePath1: 'assets/bella.jpg',
                imagePath2: 'assets/bella2.jpg',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
